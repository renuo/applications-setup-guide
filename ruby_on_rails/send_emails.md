# :mailbox: Send Emails

As soon as you have to send emails please follow those suggestions.
They will help you having a proper system to deliver emails and development environment.

## Configuration

* Add the following to your Gemfile and `bundle install`

```ruby
group :development do
  gem 'letter_opener'
end
```

* add the following to `config/application.example.yml`

```yml
APP_HOST: '[project-name].localhost'
APP_PORT: '3000'
MAIL_SENDER: 'yourname+<application>@example.com'
MAIL_HOST: ''
MAIL_USERNAME: ''
MAIL_PASSWORD: ''
```

* update `app/mailers/application_mailer.rb`

```ruby
class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_SENDER']  # <-- change this
  layout 'mailer'
end
```

* add the following to `config/application.rb`

```ruby
config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
```

* add the following to `config/environments/development.rb`:

```ruby
config.action_mailer.delivery_method = :letter_opener
```

* add the following `config/environments/production.rb`:

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

## Sparkpost

Follow the [sparkpost](../sparkpost.md) section to configure Sparkpost on your production environment
