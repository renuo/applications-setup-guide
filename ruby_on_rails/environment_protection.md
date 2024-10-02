# Staging Environment Protection

## Configuration for Deploio

HTTP Basic Authentication should be configured to prevent public traffic on our development applications.

With Deploio, you have two options:

1. **Configuring Basic Auth on the side of Deploio**
    - When using Deploio Basic Auth, you can't set the Basic Auth credentials manually. You can only regenerate them by disabling and reenabling Basic Auth for a given project or application.
    - Basic Auth is not controlled via environment variables.

2. **Configuring Basic Auth in the Rails app**
    - See the Heroku guide for details.

> **Note:** It is not advised to use both methods simultaneously.

### Managing Basic Auth via Rails

To manage Basic Auth via Rails, use the following commands:

```sh
nctl config set --project {PROJECT_NAME} --application {APPLICATION_NAME} --env=BASIC_AUTH={USERNAME}:{PASSWORD}
nctl config set --project {PROJECT_NAME} --application {APPLICATION_NAME} --basic-auth false
```

### Managing Basic Auth via Deploio

To manage Basic Auth via Deploio, use the following command:

```sh
nctl config set --project {PROJECT_NAME} --application {APPLICATION_NAME} --basic-auth true
```

## ApplicationController Configuration

Regardless of whether you are using Deploio or Heroku, configure the `ApplicationController` like this when managing Basic Auth via Rails:

```ruby
class ApplicationController < ActionController::Base
  # ...

  ENV['BASIC_AUTH'].to_s.split(':').presence&.then do |username, password|
    http_basic_authenticate_with name: username, password: password
  end

  # ...
end
```

## Configuration for Heroku

Add `# BASIC_AUTH: 'admin:some-memorable-password'` to `application.example.yml`, then run the following command:

```sh
heroku config:set BASIC_AUTH='admin:[first-memorable-password]' --app [your-app]-develop
```

Finally, save the passwords in 1Password.
