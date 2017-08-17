# Google analytics

We want to setup google analytics separately for each of our heroku apps (master, develop, testing).

To add a new project to the GA account go to <https://www.google.com/analytics> and login as google@renuo.ch.

1. Go to the tab 'Verwalten' and you will see a dropdown on the left with all the project
1. Chose the lowest one that says 'Neues Konto hinzufügen'
1. Fill out the Data based on your project. (Only select the upper two check-boxes in the end)
1. In Property Management, make sure you have activated the option "Enable Demographics and Interest Reports"/"Berichte zur Leistung nach demografischen Merkmalen und Interesse aktivieren"
1. Once you saved the Account you will see the tracking snippet.
1. **deprecated**: If you are using rack-google-analytics then add the advertising: true option

```ruby
config.middleware.use Rack::GoogleAnalytics, anonymize_ip: true, advertising: true, tracker: ENV['GOOGLE_ANALYTICS_ID']  if Rails.env.production?
```

7. If you are not using rack-google-analytics, between

```js
ga('create', 'UA-XXXXXXXX-X', 'auto');
ga('send', 'pageview');
```

fill in this line

```js
ga('require', 'displayfeatures');
```

and before them introduce this one:

```js
ga('set', 'anonymizeIp', true);
```

so in the end, it is adapted like this:

```js
ga('create', 'UA-XXXXXXXX-X', 'auto');
ga('set', 'anonymizeIp', true);
ga('require', 'displayfeatures');
ga('send', 'pageview');
```

8. Write down the tracking ID (the string in the snippet with all caps and starting with an UX-XXX....) and note it - you will need it for the heroku config

Do this for all 3 branches, but instead of adding an account, add a property for the second and the third branch.
