# NewRelic

* add the following gem to your Gemfile:

```ruby
group :production do
  gem 'newrelic_rpm'
end
```

* add a NewRelic configuration file inside `config` folder. You can use the [template](../templates/config/newrelic.yml).

* add the new variables to your Heroku environments:

```yml
NEW_RELIC_LICENSE_KEY='from newrelic'
NEW_RELIC_APP_NAME='[project-name]-[branch-name]'
```

* Go to the newrelic account: <https://rpm.newrelic.com/>

* For each app:
  * Navigate to Settings > Application
  * Click on button "move configuration to new relic"
  * Check settings, adjust them if needed.
