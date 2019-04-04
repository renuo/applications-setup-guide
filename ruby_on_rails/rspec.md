# Setup RSpec

RSpec is a *de-facto* standard and is used in all our projects.
We love rspec and we strongly suggest you to use it as well.
Even if is not mandatory, we believe you should discuss with your team the decision of not using it.

Add the following gems to your Gemfile:

```ruby
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
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
    add_filter do |source_file|
      source_file.lines.count < 5
    end
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

* Inside `spec/rails_helper.rb` after `require 'rspec/rails'` add the following system test configurations:

  ```ruby
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'selenium/webdriver'

  RSpec.configure do |config|
    # other configs

    config.before(:each, type: :system) do
      driven_by :rack_test
    end

    config.before(:each, type: :system, js: true) do
      driven_by :selenium_chrome_headless
    end
  end
  ```

  Please check the [rails_helper template](../templates/spec/rails_helper.rb).

* Add the line `bundle exec rspec` to `bin/check`

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

## Optional: catch javascript errors

If you want to catch Javascript errors in your system tests, you can add the following to the `rails_helper.rb`:

```ruby
config.after(:each, type: :system, js: true) do
  errors = page.driver.browser.manage.logs.get(:browser)
  if errors.present?
    aggregate_failures 'javascript errors' do
      errors.each do |error|
        expect(error.level).not_to eq('SEVERE'), error.message
        next unless error.level == 'WARNING'

        STDERR.puts 'WARN: javascript warning'
        STDERR.puts error.message
      end
    end
  end
end
```
