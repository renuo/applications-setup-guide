# Font-Awesome

You can either include font-awesome through their CDN or install it via npm/yarn. 

## Installation with yarn

### Set up
#### PRO version
1. Look up the auth token which can be found [here](https://fontawesome.com/account). The credentials can be found on passwork
1. Follow [these steps](https://fontawesome.com/how-to-use/on-the-web/setup/using-package-managers#installing-pro) to set up _font-awesome_ pro either per project or globally.

#### Free
For the free version of _font-awesome 5_ just run `yarn add @fortawesome/fontawesome-free`

### Inclusion for Webpacker
Include this code in your `stylesheets.scss`
```
$fa-font-path: '~@fortawesome/fontawesome-free/webfonts';
@import '~@fortawesome/fontawesome-free/scss/fontawesome';
@import '~@fortawesome/fontawesome-free/scss/solid';
```

## Useage

1. Navigate to the [font-awesome gallery list](https://fontawesome.com/icons?d=gallery)
1. Search for the icon that you wish to include and copy paste the `<i>` tag into your application:
For example for the Angular symbol I can just use this tag: `<i class="fab fa-angular"></i>`
