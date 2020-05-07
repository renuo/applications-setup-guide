# Lograge

Add the following to enable us to opt-in to lograge in production:

```ruby
# config/environments/production.rb

Rails.application.configure do
  config.lograge.enabled = ENV['LOGRAGE_ENABLED'] == 'true'
end
```
