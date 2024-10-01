# Setup Deploio Application

* You've [read about what Deploio is](https://docs.nine.ch/docs/deplo-io/getting-started-with-deploio)
* You have a Deploio account.
* You have installed the `renuo-cli` gem
* You have installed the `nctl` command
* You have been logged in using `nctl`

## Setup the remote configuration

Run the command `renuo create-deploio-app [project-name]` to generate a script which will create and configure all Deploio apps. `[project-name]` string length is limited to 63 characters.

Please review the script before running it and execute only the commands you need and understand.

**If you don't know what a command does: read the documentation and then execute it.**

If you think that the script is outdated please open a Pull Request on the [renuo-cli](https://github.com/renuo/renuo-cli) project.

## Next steps

That's it! You have now a configured Deploio application. No more configuration is needed.

# Setup Heroku Application

## Prerequisites:

* You've [read about what Heroku is](https://www.heroku.com/platform)
* You have a Heroku account.
* You have installed the `renuo-cli` gem

## Setup the remote configuration

Run the command `renuo create-heroku-app [project-name]` to generate a script which will create and configure all
Heroku apps. `[project-name]` string length is limited to 22 characters.

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

  Like this you can mark files and folders to be excluded from the Heroku slug.

