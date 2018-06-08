# Configure Percy

## Create a new project on the Percy website.

1. Visit [this](https://percy.io/organizations/renuo/projects/new) link.
1. Give the project a name and select the github repository of the project.
If you can't find the github repository in the dropdown you need to ask wg-operations to add the project to Percy.

## Setup the CI

1. Add the PERCY_TOKEN and PERCY_PROJECT env variables to the CI.

## Setup the Rails application

1. Add the gem `percy-capybara` to the test group in the gemfile and run `bundle install`.
1. Follow the setup instructions [here](https://percy.io/docs/clients/ruby/capybara-rails#setup)
1. If the application uses the gem `vcr`, add `config.ignore_hosts 'percy.io'` to your `vcr_setup.rb` file.

## Start using Percy

Create a snapshot in any capybara spec by adding the following line:

`Percy::Capybara.snapshot(page, name: 'name of your snapshot')`
