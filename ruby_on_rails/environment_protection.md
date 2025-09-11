# Staging Environment Protection

HTTP Basic Authentication should be configured to prevent public traffic on our development applications.

## Configuration for Heroku

With Heroku, basic auth can be configured as follows:

Add `# BASIC_AUTH: 'admin:some-memorable-password'` to `application.example.yml`, then run the following command:

```sh
heroku config:set BASIC_AUTH='admin:[first-memorable-password]' --app [your-app]-develop
```
Finally, save the passwords in 1Password.

## Configuration for Deploio

On Deploio, basic auth can be configured in the following way:

```sh
nctl update app {APPLICATION_NAME} --project {PROJECT_NAME} --basic-auth=true
```

Credentials can be changed like this:
```sh
nctl update app {APPLICATION_NAME} --project {PROJECT_NAME} --change-basic-auth-password
```
