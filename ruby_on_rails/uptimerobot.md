# Uptimerobot Monitoring

To ensure that our application is always up and running, we offer a monitoring
service to the customers.

When we are still developing a new application, the uptimerobot check should not be
setup to avoid premature costs. Once the go-live date is very close, we enable
the monitoring only for the `master` environment, which *must* have a paid
dyno.

## Setup

You will need Renuo-CLI to be set up and at the newest version: 
`gem install renuo-cli` --> see [renuo-cli](https://github.com/renuo/renuo-cli)

1. Run the command `renuo-cli setup-uptimerobot [url] [scope]`
   * Where `url` is the address that you want to setup monitoring for
   * Where `scope` is the scope you want the application for. 
     * This can either be "internal" for an internal renuo project (like _gifcoins_ or _redmine_)
     * Or "clients", where it refers to a client project(like _germann_ or _schuler_)

   This is used for the mail-addresses and slack channels that get contacted if the website of your project goes down.
1. The app will ask for the `api-key` for uptimerobot. It can be found at the companies' password manager. 
    Paste it and press enter to continue.

The command will setup the project in a paused state. You can start it once your app has a paid dyno.

**Until then do not start the monitoring.**

## Examples

* `renuo-cli setup-uptimerobot https://germann.ch clients`
* `renuo-cli setup-uptimerobot https://redmine.ch internal`
