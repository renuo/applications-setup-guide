# Staging Environment Protection

HTTP Basic Authentication should be configured to prevent public traffic on our develop and testing applications

To setup authentication, configure the application controller like that:

```ruby
class ApplicationController < ActionController::Base
  # ...

  ENV['BASIC_AUTH'].to_s.split(':').presence&.then do |username, password|
    http_basic_authenticate_with name: username, password: password
  end

  # ...
end
```

Add `# BASIC_AUTH: 'admin:some-memorable-password'` to `application.example.yml`, run the following commands:

```sh
heroku config:set BASIC_AUTH='admin:[first-memorable-password]' --app [your-app]-develop
heroku config:set BASIC_AUTH='admin:[second-memorable-password]' --app [your-app]-testing
```

and save the passwords in 1Password.
