# Font-Awesome

You can either use the font-awesome icons directly or install it via a gem/yarn.

## Without installation
1. Navigate to the [font-awesome gallery list](https://fontawesome.com/icons?d=gallery)
1. Search for the icon that you wish to include and copy paste the `<i>` tag into your application:
For example for the Angular symbol I can just use this tag: `<i class="fab fa-angular"></i>`

## With installation
_Prior to webpacker, when rails used sprockets, one could just include [this gem](https://github.com/bokmann/font-awesome-rails) and use their helpers._

Now, with webpacker, you have to install it through `npm`.
1. For _font-awesome 5_ run `yarn add @fortawesome/fontawesome-free`
1. Then include this code in your `stylesheets.scss`
```
$fa-font-path: '~@fortawesome/fontawesome-free/webfonts';
@import '~@fortawesome/fontawesome-free/scss/fontawesome';
@import '~@fortawesome/fontawesome-free/scss/solid';
```
