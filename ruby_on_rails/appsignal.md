# Logging & AppSignal

AppSignal is a service to record logs, monitor errors and performance.
Recording logs works independently from the tech stack. So you should use AppSignal
to record logs even if you don't use Rails. In Heroku we'll add a log drain to
redirect the multiplexed Logplex logs to AppSignal in any case.

## With the AppSignal agent

If you want to log errors and metrics, you need to install the AppSignal agent
into your app. See integration instructions for [Ruby/Rails](https://docs.appsignal.com/logging/platforms/integrations/ruby.html).

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

Once you deploy the app and collect data the app will show up in the appsignal dashboard.
Navigate to **Logging** -> **Manage Resources** and **Add log resource** with these settings:

| Setting        | Value              |
| -------------- | ------------------ |
| Source name    | `Rails`            |
| Platform       | `Heroku Log Drain` |
| Message format | `logfmt`           |

Then add this ingestion endpoint as a log drain using the Heroku commands displayed.

## Only Logs

Choose the "JavaScript" option on the AppSignal project page to
setup your project without an active agent.

## Configuration adjustments

### Correct Severity

According to [the docs](https://docs.appsignal.com/logging/platforms/heroku.html), getting the severity to be anything but "INFO" is not possible using the heroku drain.

However, there is now a way to send the `"severity=XYZ"` logfmt information and have that be applied correctly in appsignal. Unfortunately, just setting this seems to break the recognition of `request_id` in the format `[1234-5678]`. So we have to override the `ActiveSupport::TaggedLogging::Formatter` to add both the `severity` and the `request_id` in logfmt syntax.

```ruby
# frozen_string_literal: true

if Rails.env.production?
  module ActiveSupport
    module TaggedLogging
      module Formatter
        def call(severity, timestamp, progname, msg)
          logfmt_msg = ["severity=#{severity}", tags_text, msg].compact.join(' ')
          super(severity, timestamp, progname, logfmt_msg)
        end

        def tags_text
          current_tags.map do |tag|
            if tag.is_a? Hash
              tag.map { |k, v| "#{k}=#{v}" }
            else
              "[#{tag}]"
            end
          end.flatten.join(' ')
        end
      end
    end
  end
end
```

and

```ruby
# config/environments/production.rb
Rails.application.configure do
  # We use our custom key value tagging
  config.log_tags = [->(request) { { request_id: request.request_id } }]
  logger           = ActiveSupport::Logger.new(STDOUT)
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
end
```

### Lograge

We use [lograge](https://github.com/roidrage/lograge) in many projects. Here is how to configure
it with AppSignal to get properly tagged logs.

Using this configuration we get the fully tagged lograge lines and also
the full stack trace with each line tagged with the request id. This allows
us to filter by request id with one click and get all relevant log data at once.

### With AppSignal gem

```ruby
# config/initializers/lograge.rb
if ENV['LOGRAGE_ENABLED'] == 'true'
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
end
```

### Without AppSignal gem

```ruby
if ENV['RAILS_LOG_TO_STDOUT'].present?
  config.log_tags = [->(request) { { request_id: request.request_id } }]
  logger          = ActiveSupport::Logger.new($stdout)
  config.logger   = ActiveSupport::TaggedLogging.new(logger)
end
```

```ruby
# config/initializers/lograge.rb
if ENV['LOGRAGE_ENABLED'] == 'true'
  Rails.application.configure do
    config.lograge.enabled = true
    config.lograge.keep_original_rails_log = true
  end
end
```

## Automation

Unfortunately Appsignal doesn't provide an API for project configuration.
So if you need to do something on a lot of projects, you have to do it manually.

Project creation can be automated though with the following script.
Run it in a tmp folder. **It writes into a file on disk.**

```rb
#!/usr/bin/env ruby
require 'optparse'
require 'appsignal'
require 'appsignal/demo'

PUSH_API_KEY = "XXX"

options = {}
OptionParser.new do |opt|
  opt.on('--env APPSIGNAL_ENV') { |o| options[:env] = o }
  opt.on('--name APPSIGNAL_NAME') { |o| options[:name] = o }
end.parse!

raise OptionParser::MissingArgument if options[:env].nil? || options[:name].nil?

File.write 'config/appsignal.yml', <<~YAML
  #{options[:env]}:
    active: true
    push_api_key: #{PUSH_API_KEY}
    name: "#{options[:name]}"
YAML

Appsignal.config = Appsignal::Config.new(Dir.pwd, options[:env])
Appsignal::Demo.transmit
```
