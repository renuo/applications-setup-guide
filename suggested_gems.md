# Suggested gems :gem:

Here is an up-to-date version of gems which we strongly suggest to include in your project.
Please include them or give a good reason not to.

```rb
gem 'autoprefixer-rails'
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

group :production do
  gem 'lograge'  
end
```

:exclamation: Please follow the guide of each of those gems to know how to properly install it.

**Note:** Do you know all of them? Do you know why we'd like them to be included?
