# Setup Heroku Application

## Prerequisites:

* You've [read about what Heroku is](https://www.heroku.com/platform)
* You have a Heroku account.
* You have installed the `renuo-cli` gem

## Setup the remote configuration

Run the command `renuo create-heroku-app [project-name]` to generate a script which will create and configure all
Heroku apps.

Please review the script before running it and execute only the commands you need and understand.

**If you don't know what a command does: read the documentation and then execute it.**

If you think that the script is outdated please open a
Pull Request on the [renuo-cli](https://github.com/renuo/renuo-cli) project.

## Setup Rails for Heroku

* Add a file called `Procfile` to your code root:

  ```
  web: bundle exec puma -C config/puma.rb
  ```

  It's read by Heroku to start the web app and worker jobs.

* Add a file called `.slugignore` to your code root:

  ```
  /spec
  /.semaphore
  ```

  Like this you can make files and folders to be excluded from the Heroku slug.

