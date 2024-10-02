# Setup Application Server

## Prerequisites

Before setting up your application, ensure you have completed the following for your chosen platform.

### Prerequisites for Deploio

- You've [read about what Deploio is](https://docs.nine.ch/docs/deplo-io/getting-started-with-deploio).
- You have a Deploio account.
- You have installed the `renuo-cli` gem.
- You have installed the `nctl` command.
- You have logged in using `nctl`.

### Prerequisites for Heroku

- You've [read about what Heroku is](https://www.heroku.com/platform).
- You have a Heroku account.
- You have installed the `renuo-cli` gem.

## Setup Your Application

Choose the platform you want to set up your application with and follow the respective instructions.

### Setup Deploio Application

#### Remote Deploio Configuration

Run the command to generate a script which will create and configure all Deploio apps. `[project-name]` string length is limited to 63 characters:

```sh
renuo create-deploio-app [project-name]
```

Please review the script before running it and execute only the commands you need and understand.

**If you don't know what a command does: read the documentation and then execute it.**

If you think that the script is outdated, please open a Pull Request on the [renuo-cli](https://github.com/renuo/renuo-cli) project.

### Setup Heroku Application

#### Remote Heroku Configuration

Run the command to generate a script which will create and configure all Heroku apps. `[project-name]` string length is limited to 22 characters:

```sh
renuo create-heroku-app [project-name]
```

Please review the script before running it and execute only the commands you need and understand.

**If you don't know what a command does: read the documentation and then execute it.**

If you think that the script is outdated, please open a Pull Request on the [renuo-cli](https://github.com/renuo/renuo-cli) project.

#### Setup Rails for Heroku

1. Add a file called `Procfile` to your code root:

   ```sh
   web: bundle exec puma -C config/puma.rb
   ```

   This file is read by Heroku to start the web app and worker jobs.

2. Add a file called `.slugignore` to your code root:

   ```sh
   /spec
   /.semaphore
   ```

   This file allows you to mark files and folders to be excluded from the Heroku slug.

## Next Steps

That's it! You have now configured your application with either Deploio or Heroku. No more configuration is needed.
