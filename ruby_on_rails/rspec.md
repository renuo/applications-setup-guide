# Use RSpec

RSpec is a *de-facto* standard and is used in all our projects.
We love rspec and we strongly suggest you to use it as well.
Even if is not mandatory, we believe you should discuss with your team the decision of not using it.

* Add the following gems to your Gemfile

```ruby
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
```

You should know exactly why you are adding each one of them, why is necessary

## Configuration

* Install rspec via `rails generate rspec:install`
* delete the `test` folder
* At the top of the `spec/spec_helper`

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

* Inside `spec/spec_helper` we suggest you to uncomment/enable the following:

```ruby
config.disable_monkey_patching!

config.default_formatter = 'doc' if config.files_to_run.one?

config.profile_examples = 5

config.order = :random

Kernel.srand config.seed
```

Please check the [spec_helper template](../templates/spec/spec_helper.rb)

* Inside `spec/rails_helper` we suggest to uncomment/enable the following:

* after `require 'rspec/rails'`

```ruby
require 'capybara/rspec'
require 'capybara/rails'
require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  # The doc states, that the disable-gpu flag will some day not be necessary any more:
  # https://developers.google.com/web/updates/2017/04/headless-chrome
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome
```

to use headless chrome for system tests.

Please check the [rails_helper template](../templates/spec/rails_helper.rb).

* replace `bundle exec rake test` with `bundle exec rspec` in `bin/check`

## :white_check_mark: Our first (green) test

We are now going to write a first test to ensure that the whole configuration is working:

* `bin/check` should be green :white_check_mark:
* Write the test `spec/features/home_controller_spec.rb` [home_spec.rb](../templates/spec/features/home_controller_spec.rb):
* write the controller `app/controllers/home_controller.rb` [home](../templates/app/controllers/home_controller.rb)
* add `get 'home/check'` to `config/routes.rb`

* run `bin/check` and the test should pass and coverage is 100%.

Commit and push your changes! :tada:

## Verify

* Open the three apps
  * <https://[project-name]-master.herokuapp.com/home/check>
  * <https://[project-name]-develop.herokuapp.com/home/check>
  * <https://[project-name]-testing.herokuapp.com/home/check>

Check that you see `1+2=3` in each app.

