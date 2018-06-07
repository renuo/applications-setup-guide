# Configure Percy

It's now time to configure Percy.

__Create a new project on the percy website.__

1. Visit [this](https://percy.io/organizations/renuo/projects/new) link.
1. Give the project a name and select the github repository of the project.
If you can't find the github repository in the dropdown you need to ask wg-operations to add the project to percy first.

__Setup the CI__

1. Add the PERCY_TOKEN and PERCY_PROJECT env variables to your CI.

__Setup your Rails application__

1. Add the gem `percy-capybara` to your gemfile and run `bundle install`.
1. Add the following 2 lines to the `RSpec.configure do |config|` block in your `spec_helper.rb` file.

```
config.before(:suite) { Percy::Capybara.initialize_build }
config.after(:suite) { Percy::Capybara.finalize_build }
```

Additionally, if your application uses the gem `vcr` you need to add the following line to your `vcr_setup.rb` file.

`config.ignore_hosts 'percy.io'`

__Start using Percy__

That's it. Now you can create a snapshot in any capybara spec by adding the following line:

`Percy::Capybara.snapshot(page, name: 'name of your snapshot')`
