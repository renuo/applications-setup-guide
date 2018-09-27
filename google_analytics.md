# Google Analytics

Google Analytics is only set up for the master branch (since \*.renuoapp.ch domains are tracked via Cloudflare injection).

To add a new project to the GA account go to <https://www.google.com/analytics> and login as google@renuo.ch.

1. Go to the tab 'Verwalten' and you will see a dropdown on the left with all the project
1. Chose the lowest one that says 'Neues Konto hinzufügen'
1. Fill out the Data based on your project. (Only select the upper two check-boxes in the end)
1. In Property Management, make sure you have activated the option "Enable Demographics and Interest Reports"/"Berichte zur Leistung nach demografischen Merkmalen und Interesse aktivieren"
1. Once you saved the Account you will see the tracking snippet.
1. Write down the tracking ID (the string in the snippet with all caps and starting with an UX-XXX....) and note it - you will need it for the Heroku config.

## Javascript only (recommended)

This way is recommended in the normal case, because it doesn't involve another gem dependency.

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

Make sure you insert this script at the end of the <head> tag of the page (not in the <body>).

## Ruby rack-tracker

There's a gem which can be used for a lot of trackers: <https://github.com/railslove/rack-tracker#installation>

```ruby
config.middleware.use(Rack::Tracker) do
  if ENV['GOOGLE_ANALYTICS_ID'].present?
    handler :google_analytics, tracker: ENV['GOOGLE_ANALYTICS_ID'], anonymize_ip: true, advertising: true
  end
end
```
