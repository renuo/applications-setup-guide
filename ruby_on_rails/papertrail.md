# Papertrail

## Setup Usage Notifications

* Remove admin@renuo.ch from the recipients of the Usage Notifications and add operations@renuo.ch.

## Setup Alerts

* Go to https://dashboard.heroku.com/apps and login with you Renuo account

* Select the App for which you want to set alerts.

* Advance to the `master` branch.

![app_environments](../images/app_environments.png)

* Select the papertrail add-on and wait until you get redirected.

![papertrail add-on](../images/papertrail_addon.png)

* Advance to the `Alerts` section.

![papertrail events](../images/papertrail_events.png)

You should see this prompt:

![papertrail prompt](../images/papertrail_prompt.png)

* Enter the email adress `operations@renuo.ch` and click `Create Alert`.

* Click on the newly created email alert for additional configuration.

Click the litte pen above the query to edit it:

![papertrail config](../images/papertrail_config.png)

* Name the search `Response time and memory usage`.

* Add the query `"Error R14" OR "code=H12"`.

* Click the `Update Search` button.

![papertrail query config](../images/papertrail_query_config.png)

After you saw the message that the search was saved successfully, you can click on the newly created email alert to get back to the configuration view from before.

* Set the frequency to `1 Day`.

* Set `Trigger when` to `at least 10 new events match`.

* Set `Send events with timestamps in` to our timezone _(GMT+01:00)Bern_.

* Click on `save changes`.

This is what the final config should look like:

![papertrail finished config](../images/papertrail_finished_config.png)
