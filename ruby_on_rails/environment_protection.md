# Staging Environment Protection

## Configuration for Heroku

Add

```bash
# BASIC_AUTH="admin:some-memorable-password"
``` to `.env.example`, then run the following command:

```sh
heroku config:set BASIC_AUTH='admin:[first-memorable-password]' --app [your-app]-develop
```
Finally, save the passwords in 1Password.

## Configuration for Deploio

HTTP Basic Authentication should be configured to prevent public traffic on our development applications.

With Deploio, configure Basic Auth in the Rails app:

### Managing Basic Auth via Rails

To manage Basic Auth via Rails, use the following commands:

```sh
nctl update app {APPLICATION_NAME} --project {PROJECT_NAME} --env=BASIC_AUTH=USERNAME}:{PASSWORD}
nctl config set --project {PROJECT_NAME} --application {APPLICATION_NAME} --basic-auth false

```

## ApplicationController Configuration

Configure the `ApplicationController` like this when managing Basic Auth via Rails:

```ruby
class ApplicationController < ActionController::Base
  # ...

  ENV['BASIC_AUTH'].to_s.split(':').presence&.then do |username, password|
    http_basic_authenticate_with name: username, password: password
  end

  # ...
end
```
