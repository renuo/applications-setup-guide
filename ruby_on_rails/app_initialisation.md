# Initialise the Rails App

* Check if you are using the latest version of ruby supported by SemahoreCI and Heroku with `ruby -v` and update it if you are not.
Run `rbenv versions` to check your installed ruby versions.
Follow the instructions on screen to eventually install it.

* Run `gem install bundler` to install Bundler.
You may have it already installed, but this command will make sure that you have the latest version.

* [Check if you are using the latest stable version of Rails](http://rubyonrails.org/) with `rails -v` and update it if you are not.
You can do this with `gem update rails`.

* Start a new Rails project using `rails new [project-name] -d postgresql --skip-sprockets --webpack` where the `project-name` is exactly the one you chose before.
You may want to choose a different database from Postgres, but most of the time that will be your choice.
If you do not need a DB you may rethink the fact that you may not need Rails at all :) Take a look at [Sinatra](http://www.sinatrarb.com/) or [Angular](https://angular.io/)

* Specify the ruby version in the project's `Gemfile` with

```ruby File.read(File.join(__dir__, '.ruby-version'))```

[This is used by Heroku to determine what version to use.](https://devcenter.heroku.com/articles/ruby-versions)

## bin scripts

* Add a `bin/run` file which runs `bundle exec puma` and make it executable:

```sh
echo "#\!/bin/sh\n\nbundle exec puma" >> bin/run
chmod +x bin/run
```

This will be the file to start our project.

* Add an empty `bin/fastcheck` file and make it executable:

```sh
echo "#\!/bin/sh\n" >> bin/fastcheck
chmod +x bin/fastcheck
```

This will be used as a hook before pushing to quickly check for linting issues.

* Add a `bin/check` file which runs `bin/fastcheck` and `bundle exec rake test` and make it executable (`chmod +x bin/check`)

```sh
#!/bin/sh

set -e

bin/fastcheck

bundle exec rake test
```

This will be the command that runs the tests for our applications.
We use a script for that so that we can change the commands for tests in a PR, without breaking the CI and without the need of changing its configuration.

## figaro (or dotenv)

* Add `figaro` to Gemfile. Check the [gem homepage](https://github.com/laserlemon/figaro) to see how to install the gem
(usually `bundle exec figaro install` is enough)
* and create `config/application.example.yml` where you will specify the only environment variable you need for now:
  `SECRET_KEY_BASE`.
* Add the following section to your `bin/setup` script so that the application.yml is created when the project is setup:

```ruby
    puts "\n== Copying sample files =="
    unless File.exist?('config/application.yml')
      system! 'cp config/application.example.yml config/application.yml'
    end
```

## bin/setup

Add the `pre-push` hooks that will run the linters before you push the code to the remote repository:

```ruby
unless File.exist?('.git/hooks/pre-push')
  system 'ln -s ../../bin/fastcheck .git/hooks/pre-push'
end
```

* Change also  `system!('bundle install')` to `system!('bundle install --jobs=3 --retry=3')`
and uncomment the installation of yarn dependencies with `system('bin/yarn')`

* Run `bundle exec rails db:migrate` to generate an empty `schema.rb` file
* Run `bin/setup`.

## Configurations

* Update `config/application.rb` and set the default language and timezone

```ruby
config.time_zone = 'Bern' # may vary
config.i18n.default_locale = :de # may vary
```

* Update your `config/environments/production.rb` settings:

```ruby
config.force_ssl = true # uncomment
config.log_level = :warn # change
```

* Update `config/environments/test.rb` settings:

```ruby
config.action_view.raise_on_missing_translations = true # uncomment
```

* Enable the default Content Security Policies in `config/initializers/content_security_policy.rb`.

The report URI will be set later in the step of Sentry configuration.

* Commit all your changes in the master branch.
