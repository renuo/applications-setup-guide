## Ruby On Rails 5.1

This setup will cover a pure, monolithic, Rails Applications.
This is the most frequent type of application we have at Renuo and probably also the easiest to setup.
The application (and relative github repo) will be named after the `[project-name]` you chose before.

**Be careful: this guide explains how to configure a Rails Application and not a Rails API Application!**
If you have to setup an API-Only application follow the [relative guide](ruby_on_rails_api.md).

1. [Initialise the Rails App](app_initialisation.md)
1. [Push to Git Repository](first_git_push.md)
1. [Initialise Gitflow](initialise_gitflow.md)
1. [Configure the CI](configure_ci.md)
1. [Create an Application Server](create_application_server.md)
1. [Configure Continuous Deployment](configure_cd.md)

Once here your app should be up and running on all three environments.

It's now time to introduce some more tools which will help you and the team to keep a high quality during the project development.

1. [Linting and automatic checks](linting_and_automatic_check.md)
2. [RSpec](rspec.md)
2. [GetSentry](../getsentry.md)

:tada: Finally you are ready to start working on you new project! :tada:

Here you will find a series of chapters and guides on how to setup some of the gems we use most often:

1. capybara tests
2. database_cleaner
3. paperclip
4. amazon s3 and cloudfront
5. sparkpost
