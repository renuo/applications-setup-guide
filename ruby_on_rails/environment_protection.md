# Staging Environment Protection

To protect Renuo from a lawsuit for using copyrighted material, staging applications should be protected using HTTP Basic auth to prevent unwanted traffic.

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

Add `BASIC_AUTH: 'admin:some-memorable-password'` to `application.example.yml` and run the following commands:

```sh
heroku config:set BASIC_AUTH='admin:[some-memorable-password]' --app [your-app]-develop
heroku config:set BASIC_AUTH='admin:[some-memorable-password]' --app [your-app]-testing
```

(save the passwords in 1password)
