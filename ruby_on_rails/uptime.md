# Uptime Monitoring

To ensure that our application is always up and running, we offer a monitoring
package to the customers. Those who decide to apply for this package will get
the added benefit of a monitored application, so that we can act quickly if the
application goes down.

This check should be enabled only when the following conditions are met:
  * The customer applied for the monitoring package
  * The application has a paid dyno

When we are still developing a new application, the uptime check should not be
setup to avoid premature costs. Once the go-live date is very close, we enable
the monitoring only for the `master` environment, which *must* have a paid
dyno.

* Go to the *Uptime* account: <https://uptime.com/>
* Go to [Monitoring](https://uptime.com/devices/services)
* Click "Add Check"
  * Name: `[project-name]-master`
  * Contact: Choose the appropriate contact (e.g. your team)
  * Check type: "Website HTTP(S)"
  * URL: `https://[project-name]-master.renuoapp.ch/home/check`
  * String to expect: "1+2=3"
* Click Save. The Check should appear in the list of checks.
