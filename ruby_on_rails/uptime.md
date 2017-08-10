# Uptime Monitoring

To make sure we know our application is always up and running we set up an uptime-monitoring that periodically
sends a request to the application and checks whether the returned response is correct.
This check is only applied to the `master` environment, since it would drain the free hours on Heroku
if we would do this for all envs.

* Go to the uptime account: https://uptime.com/
* Go to [Monitoring](https://uptime.com/devices/services)
* Click "Add Check"
  * Name: `[project-name]-master: app/check`
  * Contact: Choose corresponding contact (e.g. your team)
  * Check type: "Website HTTP(S)"
  * URL: `https:[project-name]-master.renuoapp.ch/home/check"
  * String to expect: "1+2=3"
* Click Save. The Check should appear in the list of checks.
