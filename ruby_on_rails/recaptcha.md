# reCAPTCHA v3

Here you will learn how to implement reCAPTCHA v3 into a project. It is pretty simple to use and doesn't
hinder the users at all, as it all runs in the background.

## Implementation

Before you start, consider checking which page you would like to protect against suspicious activity (like spambots).

### Site registration

After you've decided, you can go to the [reCAPTCHA admin panel](https://www.google.com/recaptcha/admin) and register
a new site. Make sure you're using the Renuo admin account.

To register the site, you can follow these steps:
1. Use `[project-name]` as a label for the site.
1. Choose reCAPTCHA v3
1. Add all the domains on which reCAPTCHA should work (`renuoapp.ch` should also be included for the `develop` environment)

After you've provided all the necessary data, you will be forwarded to a page where you will find the `site` and
`secret` keys. These will be needed later on (you can always find them in the site settings).

### Frontend implementation

For the frontend implementation, you can follow [these steps](https://developers.google.com/recaptcha/docs/v3)
and integrate reCAPTCHA into the chosen view.

### Backend implementation

For the validation to work, you will also need some backend code which will call the reCAPTCHA verification API,
which then returns a score based on which it will be decided if the request (to your site) was normal or suspicious. You can follow [these steps](https://developers.google.com/recaptcha/docs/verify) to do it.

If you have trouble integrating reCAPTCHA, you can find some inspiration by checking out one of these pull requests:
1. [Kingschair](https://github.com/renuo/kingschair2/pull/182)
1. [Germann](https://github.com/renuo/germann/pull/314)

## Testing

In order to test it, you can add `localhost` as a domain in the
[reCAPTCHA admin panel](https://www.google.com/recaptcha/admin) and provide the required keys in
the `.env`. If your integration worked, then you will see a small container in the bottom right
corner of your chosen page, something like this:
![reCAPTCHA demonstration](https://user-images.githubusercontent.com/31915276/55479133-ae4f8c80-561d-11e9-9df2-d94cbc5f92d3.png)
