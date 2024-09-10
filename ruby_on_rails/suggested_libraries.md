# Suggested gems

Here is an hopefully up-to-date version of gems which we strongly suggest to include in your project.
Please include them or find a good reason not to.

:exclamation: Please follow the guide of each of these libraries to know how to properly install them. :exclamation:

> **:bulb:** Do you know all of them? Do you know why we'd like them to be included?

```rb
gem 'simple_form'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
end

group :production do
  gem 'lograge'
end
```

> **:bulb:** Note that to install `simple_form` you need to run `rails generate simple_form:install --bootstrap` (without option if not using Bootstrap) after adding it to your Gemfile.
