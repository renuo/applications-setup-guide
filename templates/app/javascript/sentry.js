import * as Sentry from '@sentry/browser';

const {sentryConfig, renuoSentryConfig} = window;
Sentry.init({...sentryConfig, ...renuoSentryConfig});
window.Sentry = Sentry;
