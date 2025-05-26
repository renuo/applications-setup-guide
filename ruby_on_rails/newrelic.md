# NewRelic

NewRelic is a service to monitor app performance.

* Add the following gem to your Gemfile:

  ```ruby
  group :production do
    gem 'newrelic_rpm'
  end
  ```

* Add a NewRelic configuration file [`config/newrelic.yml`](../templates/config/newrelic.yml) folder.
  (**Note:** If you are not using Heroku, adjust the app name to something else than `HEROKU_APP_NAME`)

* Add the new variables to your Heroku environments and `.env`:

  ```yml
  NEW_RELIC_LICENSE_KEY: "from newrelic"
  ```
