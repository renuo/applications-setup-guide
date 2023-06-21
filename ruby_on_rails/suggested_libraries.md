# Suggested Libraries

Here is an up-to-date version of libraries which we strongly suggest to include in your project.
Please include them or find a good reason not to.

:exclamation: Please follow the guide of each of these libraries to know how to properly install them. :exclamation:

**:bulb:** Do you know all of them? Do you know why we'd like them to be included?

## :gem: Suggested gems

```rb
gem 'simple_form'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
end

group :production do
  gem 'lograge'
end
```
Note that to install `simple_form` you need to run `rails generate simple_form:install --bootstrap` (without option if not using Bootstrap) after adding it to your Gemfile.

## :gem: Suggested NPM packages

```
yarn add rails-ujs turbolinks
```

To configure `rails-ujs` add the following to `application.js`:

```js
import Rails from 'rails-ujs';
Rails.start();
```

To configure `turbolinks` add the following to `application.js`:

```js
import Turbolinks from 'turbolinks';
Turbolinks.start();
```
