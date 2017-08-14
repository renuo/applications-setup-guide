# Go Live

## DNS, SSL & SMTP

* Set up your DNS records (e.g CNAMES to heroku, TXT records for SparkPost, ...)
* If SparkPost has been set up with the renuoapp.ch domain and the project has its own domain now, set up SparkPost again with its own domain
* Verify that SparkPost mails are working and the [sending domain is validated](https://app.sparkpost.com/account/sending-domains).
* Verify that SSL is working correctly

## Heroku

* Check the size and amount of dynos on heroku
* Check the database size plan on heroku
* Check additional addons and according plans on heroku

## Other

* Reset admin credentials, seeds, ... if necessary
* Test the whole application by hand if everything is working as it should
