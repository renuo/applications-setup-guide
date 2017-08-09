# Initialise the Rails App

* [Check if you are using the latest stable version of Rails](http://rubyonrails.org/) with `rails -v` and update it if you are not. You can do this with `gem update rails`.

* Start a new Rails project using the usual `rails new -d postgresql [project-name]` where the `project-name` is exactly the one you chose before.
You may want to choose a different database from Postgres, but most of the time that will be your choice.
If you do not need a DB you may rethink the fact that you may not need Rails at all :)

* Add `.idea` to the `.gitignore` file since many of us use RubyMine.

* Create a `.ruby-version` file in the project's root folder and specify the [latest version of ruby](https://www.ruby-lang.org/en/downloads/).
This will be [used by rbenv to check which version of ruby to use](https://github.com/rbenv/rbenv#choosing-the-ruby-version).

## bin scripts

* Add a `bin/run` file which runs `bundle exec puma` and make it executable (`chmod +x bin/run`)

This is the file to start our project.

* Add an empty `bin/fastcheck` file and make it executable (`chmod +x bin/check`)

This will be used as a hook before pushing to quickly check for linting issues.

* Add a `bin/check` file which runs `bin/fastcheck` and `bundle exec rake test` and make it executable (`chmod +x bin/check`)

```sh
#!/bin/sh

bin/fastcheck
if [ $? -ne 0 ]; then
  exit 1
fi

bundle exec rake test
```

This will be the command that runs the tests for our applications.
We use a script for that so that we can change the commands for tests in a PR, without breaking the CI and without the need of changing its configuration.

## figaro (or dotenv)

* Add `figaro` to Gemfile and create `config/application.example.yml` where you will specify the only environment variable you need for now: `SECRET_KEY_BASE`.
Check the gem homepage to see how to install the gem (usually `bundle exec figaro install` is enough)

## bin/setup

* Add the following to the `bin/setup` script so that the application.yml is created when the project is setup:

```ruby
unless File.exist?('config/application.yml') 
  cp 'config/application.example.yml', 'config/application.yml'
end
```

* Add the `pre-push` hooks:

```ruby
unless File.exist?('.git/hooks/pre-push')
  system 'ln -s bin/fastcheck .git/hooks/pre-push'
end
```

* Change also  `system!('bundle install')` to `system!('bundle install --jobs=3 --retry=3')`

* check if `bin/setup` works properly

## Configurations

* Update your `config/environments/production.rb` settings:
```ruby
config.force_ssl = true (uncomment)
config.log_level = :warn (change)
```

* Update `config/environments/test.rb` settings:
```ruby
config.action_view.raise_on_missing_translations = true (uncomment)
```

* Commit all your changes in the master branch.