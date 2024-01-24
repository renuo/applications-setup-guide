# AppSignal

AppSignal is a service to record logs, monitor errors and performance.

Recording logs works independently from the tech stack. So you should use AppSignal to record logs even if you don't use Rails. Choose the "JavaScript" option on the AppSignal page in that case.

Now follows the guide to setup AppSignal for [Ruby/Rails](https://docs.appsignal.com/logging/platforms/integrations/ruby.html).

* Add the following gem to your Gemfile:

```ruby
  gem 'appsignal'
```

* Add a AppSignal configuration file [`config/appsignal.yml`](../templates/config/appsignal.yml) folder.

* Add the new variables to your Heroku environments:

  ```yml
  APPSIGNAL_APP_ENV: "main | develop"
  APPSIGNAL_APP_NAME: "project name without env"
  APPSIGNAL_IGNORE_ERRORS: "ActiveRecord::RecordNotFound,ActionController::UnknownFormat"
  APPSIGNAL_PUSH_API_KEY: "from appsignal"
  ```

We use the same push key for all apps. You can either copy it from another project or "create" an app on appsignal.
This will just show you the key and tell you to deploy the app with it for the app to be created.

Once you deploy the app and collect data the app will show up in the appsignal dashboard. Navigate to **Logging** -> **Manage Resources** and **Add log resource** with these settings:

Source name: rails
Platform: **Heroku Log Drain**
Message format: **logfmt**

Then add this log drain using the heroku commands displayed.

## Correct Severity

According to the docs, getting the severity to be anything but "INFO" is not possible using the heroku drain.

However, there is now a way to send the `"severity=XYZ"` logfmt information and have that be applied correctly in appsignal. Unfortunately, just setting this seems to break the recognition of `request_id` in the format `[1234-5678]`. So we have to override the `ActiveSupport::TaggedLogging::Formatter` to add both the `severity` and the `request_id` in logfmt syntax.

```
module ActiveSupport
  module TaggedLogging
    module Formatter
      def call(severity, timestamp, progname, msg)
        super(severity, timestamp, progname, "severity=#{severity} #{tags_text}#{msg}")
      end

      def tags_text
        tags = current_tags
        tags.inject('') do |text, tag|
          if tag.is_a? Hash
            text += tag.map { |k,v| "#{k}=#{v} " }.join
          else
            raise 'we use our own tags!'
          end
        end
      end
    end
  end
end
```

and

```
# config/environments/production.rb
Rails.application.configure do
  config.log_tags = [lambda { |request| {request_id: request.request_id} }]
  logger           = ActiveSupport::Logger.new(STDOUT)
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
end
```

## Lograge

We use [lograge](lograge.md) in many projects. Here is how to configure it with AppSignal to get properly tagged logs.

Using this configuration we get the fully tagged lograge lines and also the full stack trace with each line tagged with the request id. This allows us to filter by request id with one click and get all relevant log data at once.

```ruby
# config/initializers/lograge.rb
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.keep_original_rails_log = true
  config.lograge.logger = Appsignal::Logger.new(
    "rails",
    format: Appsignal::Logger::LOGFMT
  )
  config.lograge.custom_payload do |controller|
    {
      request_id: controller.request.request_id
    }
  end
end
```
