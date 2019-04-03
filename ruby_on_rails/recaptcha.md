# reCAPTCHA v3

Here you will learn how to implement reCAPTCHA v3 into a project. It is pretty simple to use and doesn't hinder the users at all, as it all runs in the background.

## Implementation
Before you start, consider checking which page you would like to protect against suspicious activity (like spambots).

### Site registration
After you've decided, you can go to the [reCAPTCHA admin panel](www.google.com/recaptcha/admin) and register a new site. Make sure you're using the Renuo admin account.

To register the site, you can follow these steps:
1. Choose a label for the site, the project name should suffice.
1. Choose reCAPTCHA v3
1. Add all the domains on which reCAPTCHA should work (`renuoapp.ch` should also be included for the `develop` and `testing` environments)

After you've provided all the necessary data, you will be forwarded to a page where you will find the `site` and `secret` keys. These will be needed later on (you can always find them in the site settings).

### Frontend implementation
For the frontend implementation, you can follow [these steps](https://developers.google.com/recaptcha/docs/v3) and integrate reCAPTCHA into the chosen view.

An example to help you out:
```javascript
if (typeof(RecaptchaKey) !== 'undefined') {
    $('[data-recaptcha]').submit(function (event) {
        grecaptcha.ready(function () {
            grecaptcha.execute(RecaptchaKey, { action: 'new_contact' })
                .then(function (token) {
                    var hiddenTag = $('<input type="hidden" name="recaptcha">');
                    hiddenTag.val(token);
                    $(event.target).append(hiddenTag);
                    event.target.submit();
                });
        });
        return false;
    });
}
```

... and for the view (slim):
```slim
- content_for :head
    - if ENV['RECAPTCHA_SITE_KEY']
        script src="https://www.google.com/recaptcha/api.js?render=#{ENV['RECAPTCHA_SITE_KEY']}"
        javascript:
            var RecaptchaKey = '#{ENV['RECAPTCHA_SITE_KEY']}';
```

### Backend implementation
For the validation to work, you will also need some backend code which will call the reCAPTCHA verification API, which then returns a score based on which it will be decided if the request (to your site) was normal or suspicious. You can follow [these steps](https://developers.google.com/recaptcha/docs/verify) to do it.

Again, an example to help you out:
```ruby
module Recaptcha
  DEFAULT_THRESHOLD = 0.5

  def recaptcha_valid?(token)
    return true unless recaptcha_enabled?

    uri = URI("https://www.google.com/recaptcha/api/siteverify?secret=#{ENV['RECAPTCHA_SECRET_KEY']}&response=#{token}")
    result = JSON.parse(Net::HTTP.get(uri))
    result['success'] && result['score'] >= DEFAULT_THRESHOLD
  rescue StandardError
    true
  end

  def recaptcha_enabled?
    [ENV['RECAPTCHA_SITE_KEY'], ENV['RECAPTCHA_SECRET_KEY']].all?(&:present?)
  end
end
```

If you still have some trouble implementing it, you can find even more inspiration by checking out one of these pull requests:
- [Kingschair](https://github.com/renuo/kingschair2/pull/182).
- [Germann](https://github.com/renuo/germann/pull/314)

## Testing
In order to test it, you can add `localhost` as a domain in the [reCAPTCHA admin panel](www.google.com/recaptcha/admin) and provide the required keys in the `application.yml`. If your integration worked, then you will see a small container in the bottom right corner of your chosen page, something like this:
<img width="1425" alt="reCAPTCHA demonstration" src="https://user-images.githubusercontent.com/31915276/55479133-ae4f8c80-561d-11e9-9df2-d94cbc5f92d3.png">
