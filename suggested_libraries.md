# Suggested Libraries

Here is an up-to-date version of libraries which we strongly suggest to include in your project.
Please include them or give a good reason not to.

:exclamation: Please follow the guide of each of these libraries to know how to properly install them. :exclamation:

**:bulb:** Do you know all of them? Do you know why we'd like them to be included?

## :gem: Suggested gems

```rb
gem 'simple_form'
gem 'slim-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end
```

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
