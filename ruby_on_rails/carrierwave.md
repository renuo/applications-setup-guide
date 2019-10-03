# Carrierwave

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

  included do
    private

    def base_path_helper
      return "tmp/uploads" if Rails.env.test?
      'uploads'
    end
  end
end
```

And also we want to clear the folder after the tests run in a `spec/support/carrierwave.rb`

```rb
# frozen_string_literal: true

uploads_test_path = Rails.root.join('public', 'tmp')

RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(Dir[uploads_test_path])
  end
end
```

6. The `SecurelyUploadable` makes sure, that your path is not guessable:

```rb
module SecurelyUploadable
  extend ActiveSupport::Concern
  include UploaderBasepath

  included do
    def store_dir
      "#{base_path_helper}/#{model.class.to_s.underscore}/#{mounted_as}/#{unguessable_id}"
    end

    private

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

8. We recommend to not run the image processing for all kind of specs, since it's slow. Therefore the initializer sets it to `false`. But for system specs we want to enable it.

* seeds_spec.rb: Not really relevant, but also often a system spec

```rb
  around do |example|
    described_class.enable_processing = false
    example.run
    described_class.enable_processing = true
  end
```

* all specs except `system` specs:

```rb
config.before(:all, type: :system) do
  PictureUploader.enable_processing = true
end


config.after(:all, type: :system) do
  PictureUploader.enable_processing = false
end
```

## Some further use cases

### One image per model

This case is well documented in the [carrierwave docs](https://github.com/carrierwaveuploader/carrierwave)

### Multiple images per model

1. Add a model with the image instance:

```rb
class YourModelPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :your_model, inverse_of: :your_model_pictures

end
```

2. Let the model accept nested attributes:

```rb
class YourModel < ApplicationRecord
  has_many :your_model_pictures, inverse_of: :your_model, dependent: :destroy
  accepts_nested_attributes_for :your_model_pictures, allow_destroy: true

  # use a short cut so you don't have to call ``your_model.your_model_pictures.first.picture` every time
  def pictures
    your_model_pictures.map(&:picture)
  end
```

3. Your controller wants to accept new files but also mark some as deleted in the same view:

```rb
params.require(:your_model).permit(*permitted_params).tap do |permitted_params|
  permitted_params[:your_model_pictures_attributes] = merged_picture_attributes(permitted_params)
end

def merged_picture_attributes(permitted_your_model_params)
  new_pictures = params.dig(:your_model, :new_your_model_pictures_attributes)
  existing_pictures = permitted_your_model_params[:your_model_pictures_attributes] || {}
  return existing_pictures if new_pictures.nil?

  existing_pictures.values.push(*new_pictures.map(&:permit!))
end
```

4. And a simple form looks then like that:

```rb
= form.file_field nil, name: 'your_model[your_model_pictures_attributes][][picture]', multiple: true
- if your_model.your_model_pictures.any?
  ul
    = form.simple_fields_for :your_model_pictures do |picture|
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
