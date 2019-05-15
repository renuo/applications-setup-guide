# Carrierwave

Carrierwave is used to upload files to S3.

1. Add `gem 'carrierwave'` and `gem 'fog-aws'`
2. In `environment.rb` add `require 'carrierwave/orm/activerecord'`
3. Add to your `application.example.yml`:
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
``
5. The `UploaderBasepath` is used, so we don't polute the `public/uploader` folder in tests. Therefore you have to add this:
```
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
end
```
