# Application Configuration

## Starter

When we sell a project we guarantee certain minimal standards. While we try our best, it is very easy to forget something. That's why we have this guide to setup a application. If you think that we can skip one of the following files, think again. *You probably don't want to skip any of the following config files.* Example: if we forget to correctly setup new relic, we don't have the performance reports when we need them. If we forget to install the secret keys, our application will not be safe. If we *forget* to ??? we will have to do it eventually, and it can only harm us.

If you think that we don't need something in the new project, ask a teammate if it's ok to skip this item.

Let's make sure everything is clean:

```sh
# this should print that there are no changes
git status
```

## Delete Redundant Files

All our secrets will be in ENV variables, so we don't need secrets.yml. We also use rspec and don't use tests. And we use our own database.yml, see later.

```sh
rm config/secrets.yml
rm -rf test
rm config/database.yml
git add .
git commit -m 'delete unused files'
```

## Automatic Config

Some files may be copied 1:1.

To help you with that, there is a renuo-cli command. It will help you setting up the project.

```sh
gem install renuo-cli
renuo application-setup-auto-config
```

It will copy the files you want from the templates listed here: https://www.gitbook.com/book/renuo/rails-application-setup-guide/edit#/edit/master/templates/auto_copy_files.md

 (Until this is implemented, here is the file list):

* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/initializers/secret_key_base.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/application.example.yml
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/database.yml
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/newrelic.yml
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/initializers/mail.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/raven.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.ruby-version
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/Gemfile.local.example.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/initializers/timeout.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/spec/spec_helper.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/spec/rails_helper.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/puma.rb
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/Procfile
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.rspec
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.editorconfig
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.rubocop.yml
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.scss-lint.yml
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/tslint.json
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/.coffeelint.json
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/bin/setup
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/bin/check
* https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/README.example.md

```sh
git add .
git commit -m 'apply automatic config'
```

## config/environments/production.rb

Uncomment / change:

```rb
config.force_ssl = true
config.action_controller.asset_host = ENV['ASSET_HOST']
```

## config/environments/development.rb

Uncomment / change:

```rb
config.action_view.raise_on_missing_translations = true
```

## Gemfile

Set the ruby version

```rb
ruby File.read('.ruby-version').strip
```

Add these gems. If you want to skip some gems and you know what you're doing, then go for it. Order the Gems alphabetically.

```rb
gem 'autoprefixer-rails'
gem 'awesome_print'
gem 'bcrypt'
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'font-awesome-rails'
gem 'goldiloader'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'pg'
gem 'rack-google-analytics'
gem 'rails'
gem 'rails-i18n'
gem 'sass-rails'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks'
gem 'typescript-rails'
gem 'uglifier'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'spring'
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'lograge'
  gem 'newrelic_rpm'
  gem 'puma'
  gem 'rack-timeout'
  gem 'rails_12factor'
  gem 'sentry-raven'
end

group :lint do
  gem 'brakeman', require: false
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
end

eval_gemfile('Gemfile.local.rb') if File.exist?('Gemfile.local.rb')
```

## config/application.rb

Add this line:

```rb
config.middleware.use Rack::GoogleAnalytics, tracker: ENV['GOOGLE_ANALYTICS_ID'] if Rails.env.production?
```

Also set the default language, and set the time_zone (most of the times this will be "Bern")

## SCSS / Coffeescript Files

```sh
mkdir app/assets/stylesheets/general
touch app/assets/stylesheets/general/layout.scss
mkdir app/assets/javascripts/general
touch app/assets/javascripts/general/init.ts
```

## Commit

Time for a commit. Review your changes carefully.

```sh
git add .
git commit -v
```

## Next Steps

```sh
bin/setup
```

If something went wrong, fix it and run bin/setup again.

## Commit

Time for a commit. Review your changes carefully.

```sh
git add .
git commit -v
```

## Devise

Once you have run bundle you have to run the following command to generate the devise configuration (*don't do anything else yet*):

```sh
bundle install
rails generate devise:install
```

### config/initializers/devise.rb

Set

```rb
config.secret_key = ENV['DEVISE_SECRET_KEY']
config.mailer_sender = ENV['MAIL_SENDER']
config.pepper = ENV['DEVISE_PEPPER']
```

## Final Commit, Push to master

```sh
git add .
git commit -v
git push origin master
```

--

--

--

## database.yml examples for other databases (sqlite and mysql)

### legacy: SQLite

https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/database.sqlite.example.yml

### Legacy: MySQL

https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/database.mysql.example.yml

## legacy: unicorn

Your app should be thread safe and you have to use Puma

See also: https://devcenter.heroku.com/articles/getting-started-with-ruby#prepare-the-app which points to https://github.com/heroku/ruby-getting-started

For existing apps which *are not thread safe* (they should be): fall back to unicorn (you also have to replace the puma gem with the unicorn gem)

So, if you have to use unicorn:

legacy: Procfile:

https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/Procfile.unicorn

legacy: config/unicorn.rb:

https://raw.githubusercontent.com/renuo/rails-application-setup-guide/master/templates/config/unicorn.rb
