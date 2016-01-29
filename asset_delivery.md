# Asset Delivery

## Option A - Use Cloudfront CDN and Cloudflare CDN -> the way to go!

The ASSET_HOST on heroku is already configured to < appname>-< branch>-assets.renuoapp.ch

For all 3 environments, execute the following two parts (Cloudfront + Cloudflare)

### Cloudfront

Go to https://console.aws.amazon.com/cloudfront/home and create a new distribution:

* Select "Web"
* Origin Domain Name = < appname>-< branch>-assets.renuoapp.ch
* Origin ID = < appname>-< branch>-assets
* Origin Protocol Policy = HTTPS Only
* Viewer Protocol Policy = HTTPS only
* (Minimum, Maximum, Default) TLL = 31536000
* Alternate Domain Names (CNAMEs) = < appname>-< branch>-assets.renuoapp.ch
* SSL Certificate = choose *.renuoapp.ch

Write down the domain name (this is something like oawiejfqjg9q.cloudfront.net). We call this the cloudfront domain name.


### Cloudflare

Add a CNAME record on Cloudflare (renuoapp.ch):

* Name:< appname>-< branch>-assets
* Domain Name: the cloudfront domain name (this is something like oawiejfqjg9q.cloudfront.net)

Click on the "cloud symbol" (column status), so that the traffic goes through the "orange cloud" (cloudflare). TODO: add screenshot...

### More Info

More info about how to setup cloudfront with Rails and why it is a good idea can be found here: https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn

Furthermore, we use Cloudflare so that the Assets are delivered via SPDY or HTTP2, so the assets load faster and sprites are not necessary.

## Option B - TODO: Try Cloudflare Only

And configure that /assets/* is always cached on Cloudflare.
