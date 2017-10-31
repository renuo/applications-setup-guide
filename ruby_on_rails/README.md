# Ruby On Rails 5.1

This setup will cover a pure, monolithic Rails Applications.
This is the most frequent type of application we have at Renuo and probably also the easiest to setup.
The application (and relative github repo) will be named after the `[project-name]` you chose before.

**Be careful: this guide explains how to configure a Rails Application and not a Rails API Application!**
If you have to setup an API-Only application follow the [relative guide](../ruby_on_rails_api/README.md).

1. [Initialise the Rails App](app_initialisation.md)
1. [Push to Git Repository](first_git_push.md)
1. [Initialise Gitflow](initialise_gitflow.md)
1. [Configure the CI](configure_ci.md)
1. [Create an Application Server](create_application_server.md)
1. [Configure Continuous Deployment](configure_cd.md)

Once here, your app should be up and running on all three environments.

It's now time to introduce some more tools which will help you and the team to keep a high quality during the project development.

1. [Linting and automatic checks](linting_and_automatic_check.md)
1. [RSpec](rspec.md)
1. [Gems :gem:](../suggested_gems.md)
1. [Cloudflare](cloudflare.md)
1. [README](compile_readme.md)

:tada: Finally you are ready to start working on you new project! :tada:

While everyone starts working there are some more things which you should setup.
They are not optional, but the rest of the team can start working even if those are not in place yet.

1. [GetSentry](getsentry.md)
1. [NewRelic](newrelic.md)
1. [Uptime Monitor](uptime.md)
1. [Gemnasium](gemnasium.md)

Here you will find a series of chapters and guides on how to setup some of the gems we use most often and some other
useful services:

1. [Slack and Project Notifications](../slack_and_notifications.md)
1. [Send emails](send_emails.md)
1. [Sparkpost](../sparkpost.md)
1. [Devise](devise.md)
1. [Sidekiq](sidekiq.md)
1. Paperclip / Carrierwave / Renuo Upload
1. Cucumber
7. Amazon S3 and Cloudfront
1. awesome_print `gem 'awesome_print'`
1. [bootstrap](bootstrap.md)
1. devise `gem 'devise'`
1. font awesome `gem 'font-awesome-rails'`
1. goldiloader / bullet `gem 'goldiloader'`, `gem 'bullet'`
1. JQuery `gem 'jquery-rails'`
1. Rack Tracker (Google Analytics) `gem 'rack-tracker'` --> see [Google Analytics](../google_analytics.md)
1. [Typescript](https://github.com/typescript-ruby/typescript-rails)
1. Favicons
1. Setup papertrail
1. [Rack CORS](../ruby_on_rails_api/rack_cors.md)
1. SEO
    * redirect non-www to www
    * Header tags
