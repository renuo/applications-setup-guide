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
3. [Gems](../suggested_gems.md)
4. [GetSentry](getsentry.md)
5. [Cloudflare](cloudflare.md)
6. [README](compile_readme.md)

:tada: Finally you are ready to start working on you new project! :tada:

While everyone starts working there are some more things which you should setup.
They are not optional, but the rest of the team can start working even if those are not in place yet.

7. [NewRelic](newrelic.md)
7. [Uptime Monitor](uptime.md)
7. [Gemnasium](gemnasium.md)


Here you will find a series of chapters and guides on how to setup some of the gems we use most often:

1. [Send emails](send_emails.md)
2. [Devise](devise.md)
3. capybara tests
4. paperclip
5. amazon s3 and cloudfront
6. sparkpost
7. awesome_print `gem 'awesome_print'`
8. bootstrap `gem 'bootstrap', '~> 4.0.0.alpha6'`
9. devise `gem 'devise'`
10. font awesome `gem 'font-awesome-rails'`
11. goldiloader / bullet `gem 'goldiloader'`, `gem 'bullet'`
12. JQuery `gem 'jquery-rails'`
13. Rack Tracker (Google Analytics) `gem 'rack-tracker'` --> see [Google Analytics](../google_analytics.md)
14. [Typescript](https://github.com/typescript-ruby/typescript-rails)
15. [Favicons](favicons.md)
16. Setup papertrail
17. SEO
    * redirect non-www to www
    * Header tags
