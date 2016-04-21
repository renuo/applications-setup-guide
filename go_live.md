# Go Live

## DNS, SSL & SMTP

* Go to https://www.cloudflare.com/ and add your site, if not already done
* Set up your DNS records (e.g CNAMES to heroku, TXT records for SparkPost, ...)
* Verify that [SparkPost mails are working](https://app.sparkpost.com/account/sending-domains), if used
  * if not: go to SPF Text Record > Settings and copy the TXT Record to cloudflare
* Verify that SSL is working correctly

## Heroku

* Check the size and amount of dynos on heroku
* Check the database size plan on heroku
* Check additional addons and according plans on heroku

## Other

* Reset admin credentials, seeds, ... if necessary
* Test the whole application by hand if everything is working as it should
