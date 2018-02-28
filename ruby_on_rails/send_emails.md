# :mailbox: Send Emails

As soon as you have to send emails please follow those suggestions. They will help you having a proper system to deliver emails and development environment.

## Configuration

- Add the following to your Gemfile and `bundle install`

```ruby
group :development do
  gem 'letter_opener'
end
```

- update `app/mailers/application_mailer.rb`

```ruby
class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']  # <-- change this
  layout 'mailer'
end
```

- add the following to `config/application.rb`

```ruby
config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
```

- add the following to `config/environments/development.rb`:

```ruby
config.action_mailer.delivery_method = :letter_opener
```

Now either setup SendGrid or SparkPost. If you need to send more than 100 mails per day use SparkPost otherwise use SendGrid. (It's more reliable and easier to set up.) (Sparkpost sometimes fails to send mails to outlook and bluewin email addresses.)

## SendGrid

- Add the SendGrid AddOn to Heroku

- add the following to `config/application.example.yml`

```yml
APP_DOMAIN: '[project-name].localhost'
APP_PORT: '3000'
MAIL_SENDER: 'yourname+<application>@example.com'
SENDGRID_USERNAME: ''
SENDGRID_PASSWORD: ''
```

- Add this gem `sendgrid-ruby` to your gemfile and run `bundle`.

- Add the following code to your `config/environments/production.rb`

```sh
ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_USERNAME'],
  password: ENV['SENDGRID_PASSWORD'],
  domain: ENV['APP_DOMAIN'],
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
```

- Add the ENV variable `APP_DOMAIN` to the testing, develop and master project on heroku.

- Add a Domain Whitelabel at <https://app.sendgrid.com/settings/whitelabel/domains>

## SparkPost

- add the following to `config/application.example.yml`

```yml
APP_HOST: '[project-name].localhost'
APP_PORT: '3000'
MAIL_SENDER: 'yourname+<application>@example.com'
MAIL_HOST: ''
MAIL_USERNAME: ''
MAIL_PASSWORD: ''
```

- add the following `config/environments/production.rb`:

```ruby
config.action_mailer.smtp_settings = {
  address: ENV['MAIL_HOST'],
  port: 587,
  enable_starttls_auto: true,
  user_name: ENV['MAIL_USERNAME'],
  password: ENV['MAIL_PASSWORD'],
  authentication: 'login',
  domain: ENV['APP_HOST']
}
```

:warning: **Never ever set up a _\_.renuoapp.ch* as a sending domain to a new created account. This will block the account on SparkPost. If you need this, choose the second option.** :warning:

There are two options to set up SparkPost:

- With a domain for the project and a separate SparkPost account (preferred, if possible)
- Without an exisiting domain ==> via renuoapp.ch SparkPost account

**Note:** With the second option, you are only able to send mails with ***@renuoapp.ch** as your mail sender.

### First Option

There should only be one SparkPost account per project. This means, that _master_, _develop_ and _testing_ use the same one.

1. Go to <https://app.sparkpost.com/sign-up/> and create a new account
2. Use the email `sparkpost+[project-name]@renuo.ch` as your username
3. Use `renuo generate-password` to generate a secure password
4. Copy the credentials into the credential store
5. Fill in the domain you plan to use
6. Confirm your email address (sent to sparkpost@renuo.ch)

  > Hint: <https://groups.google.com/a/renuo.ch/forum/#!topic/mandrill>

7. Write down the API-key in the credential store, because it's only shown once!

8. You can check your key under: <https://app.sparkpost.com/account/credentials>
9. Validate your sending domain [here](https://app.sparkpost.com/account/sending-domains), or add it if not already done (Set up SPF & DKIM with TXT DNS records)
10. Credentials for SMTP setup on your app can be found [here](https://app.sparkpost.com/account/smtp), password is your generated API-key
11. Set up your ENV-variables and test if the mails are working. Manual test emails can be send via the following command in the rails console (production environment): `ActionMailer::Base.mail(to: 'yourname@renuo.ch', subject: 'Testmail', body: 'Mail content').deliver_now!`

For DNS setup also see [Go Live](go_live.md)

ENV-variables example:

```
MAIL_USERNAME: 'SMTP_Injection'
MAIL_PASSWORD:  'YOUR API KEY'
MAIL_HOST: 'smtp.sparkpostmail.com'
MAIL_SENDER: 'Sample App <sample-app@yourdomain.tld>'
```

### Second Option

1. Go to <https://app.sparkpost.com/auth> and log in with the credentials found in the credential store
2. Create [one new subaccount](https://app.sparkpost.com/account/subaccounts) and name it like your project
3. Create [a new API-Key for your subaccount](https://app.sparkpost.com/account/credentials), with the following permissions: _Send via SMTP, Sending Domains: Read/Write_
4. Write down the API-key in the credential store, because it's only showed once!
5. Credentials for SMTP setup on your app can be found [here](https://app.sparkpost.com/account/smtp), password is your generated API-key
6. Set up your ENV-variables and test if the mails are working. Manual test emails can be send via the following command in the rails console (production environment): `ActionMailer::Base.mail(to: 'yourname@renuo.ch', subject: 'Testmail', body: 'Mail content').deliver_now!`

ENV-variables example:

```
MAIL_USERNAME: 'SMTP_Injection'
MAIL_PASSWORD:  'YOUR API KEY'
MAIL_HOST: 'smtp.sparkpostmail.com'
MAIL_SENDER: 'Sample App <sample-app@renuoapp.ch>'
```
