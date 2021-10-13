# Setup RSpec

Even though Rails uses Minitest per default, RSpec is the *de-facto* standard at Renuo. We love RSpec and we strongly suggest to use it.

Add the following gems to your Gemfile:

```ruby
group :development, :test do
  gem 'rexml'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'super_diff'
end
```

You should know exactly why you are adding each one of them and why is necessary.

* Also add `/coverage/` to your `.gitignore` file.
* Remove the `test` folder from your project (there will be one called `spec` later).

## Configuration

* Install rspec via `rails generate rspec:install`
* Create a bin stub with `bundle binstubs rspec-core`
* At the top of the `spec/spec_helper.rb`

  ```ruby
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter 'app/channels/application_cable/channel.rb'
    add_filter 'app/channels/application_cable/connection.rb'
    add_filter 'app/jobs/application_job.rb'
    add_filter 'app/mailers/application_mailer.rb'
    add_filter 'app/models/application_record.rb'
    add_filter '.semaphore-cache'
  end
  SimpleCov.minimum_coverage 100
  ```

  to run code coverage and exclude files with less then 5 lines of code.

* Inside `spec/spec_helper.rb` we suggest you to uncomment/enable the following:

  ```ruby
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 5
  config.order = :random
  Kernel.srand config.seed

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
  ```

  Please check the [spec_helper template](../templates/spec/spec_helper.rb)

* Add the configurations:
  ```rb
  # spec/rails_helper.rb:

    # after `require 'rspec/rails'`
    require 'capybara/rspec'
    require 'capybara/rails'
    require 'selenium/webdriver'
    require 'super_diff/rspec-rails'

    # ... (omitted configs here)

    RSpec.configure do |config|
      # ... (omitted configs here)

      config.before do |example|
        ActionMailer::Base.deliveries.clear
        I18n.locale = I18n.default_locale
        Rails.logger.debug { "--- #{example.location} ---" }
      end

      config.after do |example|
        Rails.logger.debug { "--- #{example.location} FINISHED ---" }
      end

      config.before(:each, type: :system) do
        driven_by :rack_test
      end

      config.before(:each, type: :system, js: true) do
        driven_by ENV['SELENIUM_DRIVER']&.to_sym || :selenium_chrome_headless
      end
    end

  # config/application.example.yml
  test:
    # SELENIUM_DRIVER: 'chrome'
    SELENIUM_DRIVER: 'headless_chrome'
  ```

* Add the line `bundle exec rspec` to `bin/check`

> **Note**: If you want to debug a spec, you can simply uncomment the line `SELENIUM_DRIVER` in the application.yml to not run it headless:

![CleanShot 2021-06-25 at 16 54 22](https://user-images.githubusercontent.com/1319150/123443347-1bbcae80-d5d6-11eb-8ba5-0d2c9ae4a37c.gif)

## :white_check_mark: Our first (green) test

We are now going to write a first test to ensure that the whole configuration is working:

* `bin/check` should be green :white_check_mark:
* Write the test [`spec/system/health_spec.rb`](../templates/spec/system/health_spec.rb)
* Write the controller [`app/controllers/home_controller.rb`](../templates/app/controllers/home_controller.rb)
* Add `get 'home/check'` to `config/routes.rb`

* Run `bin/check` and the test should pass and coverage is 100%.

Commit and push your changes! :tada:

## Verify

* Open the three apps
  * <https://[project-name]-master.herokuapp.com/home/check>
  * <https://[project-name]-develop.herokuapp.com/home/check>
  * <https://[project-name]-testing.herokuapp.com/home/check>

Check that you see `1+2=3` in each app.

## Javascript error reporter

* Create the module [`spec/support/javascript_error_reporter.rb`](../templates/spec/support/javascript_error_reporter.rb)

* Verify that `config.include JavaScriptErrorReporter, type: :system, js: true` is in your [`rails_helper.rb`](../templates/spec/rails_helper.rb)

Please check the [rails_helper template](../templates/spec/rails_helper.rb) to compare.