# Initialise the Rails Application

## Default Rails setup

* Ensure that your asdf plugins are up to date with `asdf plugin update --all`.

* Install the latest Ruby version with `asdf install ruby latest` (Check if it's supported by Heroku).

* Switch your global Ruby to the fresh one: `asdf global ruby latest`.

* Run `gem update --system` to update Ruby's default gems (e.g. `bundler`).

* [Check if you are using the latest stable version of Rails](http://rubyonrails.org/) with `rails -v` and update it if you are not.
You can do this with `gem update rails`. Beware of beta versions.

* Start a new Rails project using `rails new [project-name] --database=postgresql --no-skip-test --skip_action_mailbox` where the `project-name` is exactly the one you chose before.

> ⚠️ You may want to choose a different database than Postgres, but most of the time this will be your choice.
> If you do not need a DB you may rethink the fact that you may not need Rails at all :) Take a look at [Sinatra](http://www.sinatrarb.com/) or [Angular](https://angular.io/)
> You might also need actionmailbox of course, so always double-check the parameters that you are using.
> Check if you've got a `.ruby-version` file. If not, create one and enter the Ruby version.

> ⭐️ This setup does not include either js-bundling nor css-bundling by default. It will start with the simplest possible Rails setup and will use sprockets and importmaps.
> If you need to do fancy stuff, discuss with your team the opportunity of including a js-bundling and css-bundling tool.

* Load the Ruby version automatically in the fresh project's `Gemfile` by adding this:

  ```rb
  ruby File.read(File.join(__dir__, '.ruby-version')).strip
  ```

  [This is used by Heroku to determine what version to use.](https://devcenter.heroku.com/articles/ruby-versions)

* Run `bin/setup`

* Run `bundle exec rails db:migrate` to generate an empty `schema.rb` file.

* Then check your default Rails setup by running `rails s` and visiting `localhost:3000`.
  You should be on Rails now, yay!

## Adjustments

### Convenience scripts (`bin/*`)

The following scripts are standardized tools for more convenience at Renuo.
They are always idempotent (runnable multiple times).

* Add a `bin/run` file. It will be used to start our project.

  ```sh
  echo "#\!/usr/bin/env bash\nset -euo pipefail\n\nrails s" > bin/run
  ```

* Add a `bin/fastcheck` file. It will be used as a hook before pushing to quickly check for linting issues.

  ```sh
  echo "#\!/usr/bin/env bash\nset -euo pipefail" > bin/fastcheck
  ```

* Add a `bin/check` file. It will run all the automated tests. It's mainly used in our CI.

  ```sh
  echo "#\!/usr/bin/env bash\n\nset -euo pipefail\n\nbin/rails zeitwerk:check" > bin/check
  ```

* Make the new scripts executable

  ```sh
  chmod +x bin/run bin/fastcheck bin/check
  ```

### ENV variables with Figaro

* Add `figaro` to Gemfile. Check the [gem homepage](https://github.com/laserlemon/figaro) to see how to install the gem
(usually `bundle exec figaro install` is enough). Delete the newly created file `config/application.yml`...
* and create `config/application.example.yml` where you will specify the only environment variable you need for now:
  `SECRET_KEY_BASE`.
* Going forward we will only push the `config/application.example.yml` file to the repository in order to protect our env variables.
* Add application.yml to .gitignore
* Add the following section to your `bin/setup` script so that the `application.yml` is created from the `application.example.yml` when the project is setup locally:

  ```ruby
  puts "\n== Copying sample files =="
  unless File.exist?('config/application.yml')
    system! 'cp config/application.example.yml config/application.yml'
  end
  ```

* add one more key to application.example.yml `APP_PORT: 3000`

  Make sure it comes **before** any `rails` comands.
* To ensure you have all the required keys from the `application.example.yml` in your `application.yml`,
create the initializer for figaro in `config/initializers/figaro.rb`:

  ```ruby
  Figaro.require_keys(YAML.load_file('config/application.example.yml').keys - %w[test production development])
  ```

* Run `bin/setup` again.

### Configuration customisation

* Update `config/application.rb` and set the default language and timezone

  ```ruby
  config.time_zone = 'Zurich' # may vary
  config.i18n.default_locale = :de # may vary
  ```

* Update your `config/environments/production.rb` settings:

  ```ruby
  config.force_ssl = true # uncomment
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "warn") # change
  ```

* Update `config/environments/development.rb` settings:

  ```ruby
  config.action_controller.action_on_unpermitted_parameters = :raise
  config.i18n.raise_on_missing_translations = true # uncomment
  ```

* Update `config/environments/test.rb` settings:

  ```ruby
  config.action_controller.action_on_unpermitted_parameters = :raise
  config.i18n.raise_on_missing_translations = true # uncomment
  config.i18n.exception_handler = Proc.new { |exception| raise exception.to_exception } # add
  config.active_record.verbose_query_logs = true # add

  # add the following lines to the end of the file
  config.to_prepare do
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.create_unlogged_tables = true
    end
  end
  ```

* The default [Content Security Policies](https://github.com/renuo/applications-setup-guide/blob/master/ruby_on_rails/content_security_policy.md) should not always be activated, but rather only where there are platform secrets that need to be secured. This rule can be overwritten by a customer, if he opted into CSP when selecting his maintenance plans.

* If you're using a js-bundling tool, let's clean up after asset precompilation
  to reduce Heroku slug size. Add this to the `Rakefile`:

  ```ruby
  Rake::Task['assets:clean'].enhance do
    FileUtils.remove_dir('node_modules', true)
    FileUtils.remove_dir('vendor/javascript', true)
  end
  ```

## Finalising

* Check if the following scripts run successfully: `bin/setup`, `bin/check`, `bin/run`
* If they do, commit all your changes to the main branch with Git.
