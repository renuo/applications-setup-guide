# Use Rspec

Rspec is a *de-facto* standard and is used in all our projects.
We love rspec and we strongly suggest you to use it as well.
Even if is not mandatory, we believe you should discuss with your team the decision of not using it.

* Add the following gems to your Gemfile

```ruby
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
```

you should know exactly why you are adding each one of them, why is necessary
