# Go Live

## DNS, SSL & SMTP

* Check your DNS records, for example
  * `CNAME` to Heroku ([see their docs](https://devcenter.heroku.com/articles/custom-domains))
  * `TXT` records for [SparkPost sending domains](https://support.sparkpost.com/docs/getting-started/setting-up-domains)
  * `CAA` records ([see Cloudflare](https://developers.cloudflare.com/ssl/edge-certificates/caa-records/#create-caa-records))
* If SparkPost has been set up with the renuoapp.ch domain and the project has its own domain now, set up SparkPost again with its own domain
* Verify that SparkPost mails are working and the [sending domain is validated](https://app.sparkpost.com/account/sending-domains).
* Verify that SSL is working correctly

If the final domain isn't already in use, you can configure it also already:
Add a CNAME DNS record pointing to the app (`[project-name]-main.renuoapp.ch`).

### URL rewriting on Cloudflare

For user comfort we redirect HTTP calls to <https://example.com> to <https://www.example.com>.
This is done via page rules in Cloudflare.

1. Add a new page rule
1. Enter `example.com/*`
1. Choose "Forwarding URL"
1. Choose "301 - Permanent Redirect"
1. Enter `https://www.example.com/$1`
1. Click "Save and Deploy"

## Heroku

* Check the size and amount of dynos on Heroku
* Check the database size plan on Heroku and upgrade if it is foreseeable that 10'000 rows are exceeded in a short time
* Check additional addons and according plans on Heroku

## Other

* Reset admin credentials, seeds, ... if necessary
* Test the whole application by hand if everything is working as it should
