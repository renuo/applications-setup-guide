* config/initializers/secret_key_base.rb
* config/application.example.yml
  * Only copy the configuration parts you need. Use *.example.yml and check that into source control.
* config/database.yml
* config/newrelic.yml
* config/initializers/mail.rb
* config/initializers/sentry.rb
* .ruby-version
  * Set the latest stable ruby version.
* Gemfile.local.example.rb
* config/initializers/timeout.rb
* spec/spec_helper.rb
* spec/rails_helper.rb
* config/puma.rb
* app/helpers/raven_helper.rb
* Procfile
* .rspec
* .gitignore
* .reek
* .editorconfig
* .rubocop.yml
* .scss-lint.yml
* tslint.json
* .coffeelint.json
* .slim-lint.yml
* bin/run
* bin/setup
  * This file should be the first thing executed after cloning the project. It checks and installs all dependencies, sets up the database, and runs bin/check.
* bin/check
  * You want your code to be of a certain quality. Your code is linted, tested, does not contain security bugs, etc. Depending on your definition of done, you don't want the code to contain console.logs, etc. Use this file to call all this stuff. To ensure this on every commit, you can link bin/check to the pre_commit git hook.
* README.example.md
  * This is an example readme. If you like it, move it to README.md
