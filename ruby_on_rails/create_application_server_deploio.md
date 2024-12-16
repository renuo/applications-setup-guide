# Setup Application Server for Deploio

## Prerequisites

Before setting up your application, ensure you have completed the following for Deploio.

### Prerequisites for Deploio

- You've [read about what Deploio is](https://docs.nine.ch/docs/deplo-io/getting-started-with-deploio).
- You have a Deploio account.
- You have installed the `renuo-cli` gem.
- You have installed the `nctl` command.
- You have logged in using `nctl`.

## Setup Your Application

### Setup Deploio Application

#### Remote Configuration

Run the command to generate a script which will create and configure all Deploio apps. `[project-name]` string length is limited to 63 characters:

```sh
renuo create-deploio-app [project-name]
```

Please review the script before running it and execute only the commands you need and understand.

**If you don't know what a command does: read the documentation and then execute it.**

If you think that the script is outdated, please open a Pull Request on the [renuo-cli](https://github.com/renuo/renuo-cli) project.

## Next Steps

That's it! You have now configured your application with Deploio. No more configuration is needed.
