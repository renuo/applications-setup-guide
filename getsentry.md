# GetSentry

## Setup Monitoring Services

Go to www.getsentry.com and login as the renuo monitor. Create an entry for each heroku app (master, develop, testing). Once you have created an entry, you will see the dsn key and the public dsn key which you'll need in your config variables on heroku. Note it.

Your applications on Sentry should follow the same naming convention as everywhere else. So: <app_name>-master, <app_name>-develop, <app_name>-testing