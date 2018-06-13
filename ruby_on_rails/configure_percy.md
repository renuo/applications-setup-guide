# Configure Percy

Percy is a service that recognizes UI changes between pull requests. Read more about it [here](https://percy.io)

## Create a new project on the Percy website.

1. Ask wg-operations to add the project to Percy.
1. Visit [this](https://percy.io/organizations/renuo/projects/new) link.
1. Fill in the name with `[project-name]` and select the github repository of the project.

## Setup the CI

1. Add the PERCY_TOKEN and PERCY_PROJECT env variables to the CI.
They can be found under `https://percy.io/renuo/[project-name]/settings`.

## Setup the Rails application

1. Add the gem `percy-capybara` to the test group in the Gemfile and run `bundle install`.
1. Follow the setup instructions [here](https://percy.io/docs/clients/ruby/capybara-rails#setup)
1. If the application uses the gem `vcr`, 
follow the instructions [here](https://percy.io/docs/clients/ruby/capybara-rails#_web-mock/vcr-users).

## Start using Percy

Create a snapshot in any capybara spec by adding the following line:

`Percy::Capybara.snapshot(page, name: 'name of your snapshot')`

## When to add screenshots

Usually it's enough to add one screenshot for each view. 
In special cases you may want to add more screenshots.
