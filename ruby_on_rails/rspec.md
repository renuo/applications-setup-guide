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
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
```

You should know exactly why you are adding each one of them and why is necessary.

## Configuration

* Install rspec via `rails generate rspec:install`
* Create a bin stub with `bundle binstubs rspec-core`
* delete the `test` folder
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

* Inside `spec/spec_helper` we suggest you to uncomment/enable the following:

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

* after `require 'rspec/rails'`

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

to use headless chrome for system tests.

### Optional: catch javascript errors

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

