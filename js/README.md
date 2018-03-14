# Frontend apps

## Trivial app

Consider using only static files (example: [Green Card Predictor](https://github.com/renuo/green-card-probability-frontend))
and CDNs.

## Simple JS app

If you need a really simple JavaScript application and you need more than just an *index.html*, you can checkout this template:
<https://github.com/renuo/tamedia-altersheime/tree/dab2bb6f1bb4c7776e965d227de5b63e06240624>

It contains a very simple *webpack* configuration (production ready) featuring:

* Cucumber tests
* Fonts
* Images
* Favicon

The rest is done in these three files:

* index.html
* index.css
* index.js

## Vue.js

An alternative to the JS app mentioned above is a setup with Vue.js.
It provides a scalable foundation for your app and it's easy to understand.

To get started, install the [vue-cli](https://github.com/vuejs/vue-cli) by running `npm install -g @vue/cli`.
Then run `vue create [app-name]` to generate a vue app.
This creates a minimal setup with some default configurations and
if you wish, with some testing frameworks included like [Cypress](https://www.cypress.io) or [Jest](https://facebook.github.io/jest/).

An example Vue.js application can be found [here](https://github.com/renuo/tamedia-altersheime).

## Complex JS app

Use either React or [Angular](../angular/README.md).
