# Carrierwave

**⚠️ Don't use Carrierwave for new projects anymore. Use ActiveStorage**

Carrierwave is used to upload files to S3.

1. Add `gem 'carrierwave'` and `gem 'fog-aws'`
1. In `environment.rb` add `require 'carrierwave/orm/activerecord'`
1. Add to your `application.example.yml`:

```
#CARRIERWAVE_SALT: 'rake secret'
#S3_ACCESS_KEY_ID: ''
#S3_ASSET_HOST: ''
#S3_BUCKET_NAME: ''
#S3_SECRET_ACCESS_KEY: ''
```

4. Add `initializers/carrierwave.rb`

```rb
CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  elsif ENV['S3_BUCKET_NAME'].present?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: 'eu-central-1'
    }
    config.fog_directory = ENV['S3_BUCKET_NAME']
    config.fog_public = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.storage = :fog
    config.asset_host = ENV['S3_ASSET_HOST']
  else
    config.storage = :file
  end
end
```

5. The `UploaderBasepath` is used, so we don't polute the `public/uploader` folder in tests. Therefore you have to add this:

```rb
module UploaderBasepath
  extend ActiveSupport::Concern
  TEST_UPLOAD_PATH = 'uploads/tmp'

  included do
    private

    # :nocov:
    def base_path_helper
      return TEST_UPLOAD_PATH if Rails.env.test?

      'uploads'
    end
    # :nocov:
  end
end
```

And also we want to clear the folder after the tests run in a `spec/support/carrierwave.rb`

```rb
RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(Dir[Rails.root.join('public', UploaderBasepath::TEST_UPLOAD_PATH)])
  end
end

```

6. The `SecurelyUploadable` makes sure, that your path is not guessable:

```rb
module SecurelyUploadable
  extend ActiveSupport::Concern
  include UploaderBasepath

  included do
    def filename
      "#{time_token}#{file.extension.present? ? ".#{file.extension}" : ''}"
    end

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{unguessable_id}"
    end

    private

    def time_token
      var = :"@#{mounted_as}_time_token"
      model.instance_variable_get(var) || model.instance_variable_set(var, (Time.now.to_f * 1000).to_i)
    end

    def unguessable_id
      secret = [ENV['CARRIERWAVE_SALT'], model.id].join('/')
      Digest::SHA256.hexdigest(secret)
    end
  end
end
```

7. Implement an uploader e.g.

```rb
class PictureUploader < CarrierWave::Uploader::Base
  include SecurelyUploadable

  # add different sizes like that:
  # version :preview do
  #   process resize_to_fill: [100, 100]
  # end
end
```

8. We recommend to use image processing only when needed, since it's slow. Therefore the initializer sets it to `false`. But for `system`-specs we want to enable it, so we see how it would look like (also if used with snapshot comparison tools):

* enable it for `system` specs:

```rb
config.around(type: :system) do |example|
  CarrierWave.configure { |c| c.enable_processing = true }
  example.run
  CarrierWave.configure { |c| c.enable_processing = false }
end
```

## Some further use cases

### One image per model

This case is well documented in the [carrierwave docs](https://github.com/carrierwaveuploader/carrierwave)

### Multiple images per model

This example will have a model `User` with multiple `Picture`s

1. Add a model with the image instance:

```rb
class UserPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user, inverse_of: :user_pictures
end
```

1. Let the model accept nested attributes:

```rb
class User < ApplicationRecord
  has_many :user_pictures, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :user_pictures, allow_destroy: true
end
```

1. Simplify access to the pictures in `User`

```rb
class User < ApplicationRecord
  def pictures
    user_pictures.map(&:picture)
  end
end
```

1. Your controller wants to accept new files but also mark some as deleted in the same view:

```rb
params.require(:user).permit(*permitted_params).tap do |permitted_params|
  permitted_params[:user_pictures_attributes] = merged_picture_attributes(permitted_params)
end

def merged_picture_attributes(permitted_user_params)
  new_pictures = params.dig(:user, :new_user_pictures_attributes)
  existing_pictures = permitted_user_params[:user_pictures_attributes] || {}
  return existing_pictures if new_pictures.nil?

  existing_pictures.values.push(*new_pictures.map(&:permit!))
end
```

1. And a simple form looks then like that:

```rb
= form.file_field nil, name: 'user[user_pictures_attributes][][picture]', multiple: true
- if user.user_pictures.any?
  ul
    = form.simple_fields_for :user_pictures do |picture|
      - pic = picture.object
      li
        = picture.input :id, as: :hidden, input_html: { value: pic.id }, wrapper: false
        = image_tag pic.picture.url(:thumb)
        = picture.input :_destroy, as: :boolean, label: t('buttons.destroy')
```

### Store height and with (useful for galleries, where you need to know the size)

1. Add `gem 'mini_magick'` if you plan to resize images (quite always needed)
1. Extend your uploader:

```
class PictureUploader < CarrierWave::Uploader::Base
  ...
  include CarrierWave::MiniMagick
  ...

  process :store_dimensions

  ...

  private

  def store_dimensions
    model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions] if file && model
  end
end
```
