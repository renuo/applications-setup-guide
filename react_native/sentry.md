# Sentry

## General configuration

* Go to https://www.sentry.io and login as the renuo monitor user.

* Create a project named `[project-name]`.

* Add the project to the *#renuo* team if the client pays for monitoring, to the `#no-notifications` otherwise.

* Note the DSN key.

  ![sentry_dsn](../images/sentry.png)

* Install the npm package: `yarn add @sentry/react-native`

Add the Sentry initialisation code into `app.js` file:

```
Sentry.init({ dsn: env.SENTRY_DSN, environment: env.SENTRY_ENVIRONMENT });
```

Add the ENV variables to the `.env` files for each environment.

## Verify the installation

Open the dev console in chrome, and run

```js
try {
    throw new Error('test raven js');
} catch(e) {
    Sentry.captureException(e)
}
```

On `https://sentry.io/renuo/[project-name]` you should find "Uncaught Error: test raven js".
