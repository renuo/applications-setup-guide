# Uptimerobot Monitoring

To ensure that our application is always up and running, we offer a monitoring
service to the customers.

When we are still developing a new application, the uptimerobot check should not be
setup to avoid premature costs. Once the go-live date is very close, we enable
the monitoring only for the `main` environment, which *must* have a paid
dyno.

## Setup

You will need Renuo-CLI to be set up and at the newest version:
`gem install renuo-cli` --> see [renuo-cli](https://github.com/renuo/renuo-cli)

1. Run the command `renuo setup-uptimerobot [url]`
   * Where `url` is the address you want to monitor. e.g. `https://[project-name]-main.renuoapp.ch/home/check` or `https://customdomain/home/check`

1. The app will ask for the `api-key` for uptimerobot. It can be found at the companies' password manager.
    Paste it and press enter to continue.

The command will setup the project in a paused state. You can start it once your app has a paid dyno.

**Until then do not start the monitoring.**

## Examples

* `renuo setup-uptimerobot https://germann.ch/home/check`
