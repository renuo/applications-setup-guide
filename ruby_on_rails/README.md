# Ruby On Rails

This setup will cover a pure, monolithic Rails Applications.
This is the most frequent type of application we have at Renuo and probably also the easiest to setup.
The application (and relative github repo) will be named after the `[project-name]` you chose before.

1. [Initialise the Rails App](app_initialisation.md)
1. [Push to Git Repository](first_git_push.md)
1. [Initialise Gitflow](initialise_gitflow.md)
1. [Configure Git Repository](../configure_git_repository.md)
1. [Create an Application Server](create_application_server.md)
1. [Configure the CI / CD](configure_ci.md)

Once here, your app should be up and running on all three environments.

It's now time to introduce some more tools which will help you and the team to keep a high quality during the project development.

1. [RSpec](rspec.md)
1. [Linting and automatic checks](linting_and_automatic_check.md)
1. [Gems and libraries:gem:](suggested_libraries.md)
1. [Cloudflare](cloudflare.md)
1. [README](compile_readme.md)

:tada: Finally you are ready to start working on you new project! :tada:

While everyone starts working there are some more things which you should setup.
Most are not optional, but the rest of the team can start working even if those are not in place yet.

1. [Sentry](sentry.md)
2. [NewRelic](newrelic.md) (optional)
3. [robots.txt](robots_txt.md)
4. [Percy](configure_percy.md) (optional)
5. [Papertrail](papertrail.md)
6. [Protect develop & testing environment](environment_protection.md)

Some services should be configured accordingly to the packages bought by the customer.
Once the new application is created, please add the project to the
[monitoring list](https://docs.google.com/spreadsheets/d/1FY4jqByO-aI5sDan0hD7ULu6a2-eLsmO6kgdCFlPmuY/edit#gid=0)
and discuss with the PO how the service should be configured.

1. [Uptimerobot](uptimerobot.md)
1. Depending on the monitoring list, also [Sentry notifications](sentry.md) need to be configured.
1. [Depfu security monitoring](depfu.md)
1. Depending on the monitoring list, also [Papertrail alerts](papertrail.md) need to be configured.

Here you will find a series of chapters and guides on how to setup some of the gems we use most often and some other
useful services:

1. [Run Javascript tests with Jest](jest.md)
1. [Pull Requests Template](../pull_requests_template.md)
1. [Slack and Project Notifications](../slack_and_notifications.md)
1. [Send emails](send_emails.md)
1. [Sparkpost & Mailtrap](../sparkpost_&_mailtrap.md)
1. [Devise](devise.md)
1. [Sidekiq](sidekiq.md)
1. [Cucumber](cucumber.md)
1. [Amazon S3 and Cloudfront](aws.md)
1. [Carrierwave Upload](carrierwave.md)
1. awesome_print `gem 'awesome_print'`
1. [font-awesome](font_awesome.md)
1. [bullet](bullet.md) `gem 'bullet'`
1. [lograge](lograge.md) `gem 'lograge'`
1. Rack Tracker (Google Analytics) `gem 'rack-tracker'` --> see [Google Analytics](../google_analytics.md)
1. [Typescript](https://github.com/typescript-ruby/typescript-rails)
1. Favicons
1. [Rack CORS](https://github.com/cyu/rack-cors)
1. [Rack Attack](https://github.com/rack/rack-attack#installing)
1. [:fire: Hotjar](hotjar.md)
1. SEO
    * redirect non-www to www
    * Header tags
1. [wicked pdf](wicked_pdf.md) `gem wicked_pdf`
1. [Recaptcha v3](recaptcha.md)
