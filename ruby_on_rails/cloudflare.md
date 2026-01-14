# Cloudflare

Setup Cloudflare: <https://www.cloudflare.com/a/dns/renuoapp.ch>

* Now open
  * <http://[project-name]-main.renuoapp.ch/home/check>
  * <http://[project-name]-develop.renuoapp.ch/home/check>

Check that you:
* see "1+2=3" in each app.
* have been redirected to https.

## Crypto settings

When setting up a new site on Cloudflare, make sure you set SSL to "Full" under Crypto settings. You may end up in endless loop of redirects if it stays on the default setting ("Flexible")
