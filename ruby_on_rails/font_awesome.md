# Font-Awesome

You can either include font-awesome through their CDN or install it via npm/yarn. 

## Installation with yarn

1. For _font-awesome 5_ run `yarn add @fortawesome/fontawesome-free`
1. Then include this code in your `stylesheets.scss`
```
$fa-font-path: '~@fortawesome/fontawesome-free/webfonts';
@import '~@fortawesome/fontawesome-free/scss/fontawesome';
@import '~@fortawesome/fontawesome-free/scss/solid';
```

## Useage

1. Navigate to the [font-awesome gallery list](https://fontawesome.com/icons?d=gallery)
1. Search for the icon that you wish to include and copy paste the `<i>` tag into your application:
For example for the Angular symbol I can just use this tag: `<i class="fab fa-angular"></i>`
