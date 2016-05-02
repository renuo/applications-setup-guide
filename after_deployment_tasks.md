# After Deployment Tasks

The ones you forget easily...

## Open the apps in the browser

* Open the three apps
  * < application>-master.herokuapp.com/home/check
  * < application>-develop.herokuapp.com/home/check
  * < application>-testing.herokuapp.com/home/check

Check that you now

* see "1+2=3" in each app.
* have been redirected to https

Setup cloudflare: https://www.cloudflare.com/a/dns/renuoapp.ch

* Now open
  * < application>-master.renuoapp.ch/home/check
  * < application>-develop.renuoapp.ch/home/check
  * < application>-testing.renuoapp.ch/home/check
* have been redirected to https
  * if you get a redirect loop, set SSL to "Full SSL" here: https://www.cloudflare.com/cloudflare-settings?z=renuoapp.ch

## GitHub

Protect branches master and develop and make the develop branch the default branch. Also force check completions on the develop branch, but not on the master branch (hotfixes).

## NewRelic Settings

Go to the newrelic account: https://rpm.newrelic.com/

Again, for each app

* Navigate to Settings > Application
* Click on button "move configuration to new relic"
* Check settings, adjust them if needed.

## NewRelic Uptime Monitoring

TODO: update this since NewRelic has a newer way to do uptime monitoring.

~~Go to the newrelic account: https://rpm.newrelic.com/~~

~~The three new applications should appear here now.~~

~~Then, for each app~~

* ~~Click on the app~~
* ~~Navigate to Settings > Availability monitoring~~
* ~~Enter the URL https: < application>-< branch>.herokuapp.com/home/check~~
* ~~As validation text, enter "1+2=3"~~
* ~~Check verify SSL~~
* ~~Uncheck Redirect box~~


## CDNs for JS

Remove jQuery and Bootstrap from your JS pipeline, and replace them with the latest cdn versions. Add these after the stylesheets, and before the application JS.

https://www.jsdelivr.com/?query=jquery
https://www.jsdelivr.com/?query=bootstrap
https://www.jsdelivr.com/?query=raven

```slim
script src='https://cdn.jsdelivr.net/jquery/XXX/jquery.min.js'
script src='https://cdn.jsdelivr.net/bootstrap/XXX/js/bootstrap.min.js'
script src='https://cdn.jsdelivr.net/raven/XXX/raven.min.js'
```

## GetSentry Setup

### JS Sentry Setup

Below the raven.min.js, add the following to your application layout:

```slim
javascript: #{raven_js}
```

### Test Setup

For each heroku app, connect to the rails console:

```
heroku run rails c --app < app_name>-< branch>
```

Once connected, raise an exception and capture it using sentry:

```
begin
  1 / 0
rescue ZeroDivisionError => exception
  Raven.capture_exception(exception)
end
```

On [https://app.getsentry.com/renuo/ < app_name>-< branch>/](https://app.getsentry.com/renuo/< app_name>-< branch>/) you should find the exception of the ZeroDivisionError.

## Gemnasium

Check if Gemnasium is added and enabled the project. Also check that the icon in the Readme.md is linked correctly.

## Generate and Integrate Favicons

Add the following thing to the product backlog. You can use the gem real-favicon-rails for easy integration. Note that the customer can generate the icons, and then he can send you the JSON code which is displayed in the RoR tab.

Real Favicon Generator (http://realfavicongenerator.net/) is a service that allows us to generate favicons for all formats and devices.

If the Website is live already you can check the state and compatibility of its favicons by scrolling to the bottom of the page and checking an URL.

If you generate new favicons from scratch, there are a few thing to be aware of:

* You should start out with an image which is at least 260px by 260px
* Your image should have a transparent background (PNG format)
* When following the generation steps on the wizard, be sure to keep all of them similar (same background etc.)

Once you generated the icons, the integration instructions are displayed on the website.

## Asset Delivery

Configure asset delivery as follows: [[Asset_sync]]

## More Things / Ideas / Todos in Setup Guide

* Setup papertrail
* Document **renuoapp.ch setup** with cloudflare and heroku domain
* SEO
  * redirect non-www to www
  * Header tags
