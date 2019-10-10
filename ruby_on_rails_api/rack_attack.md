# Rack Attack

When the application starts being crawled by bad bots,
we suggest to introduce rack-attack to mitigate the requests.

You can add the following gem

```ruby
gem 'rack-attack'
```
and follow the instructions on the [gem Homepage](https://github.com/kickstarter/rack-attack)

* Add in `config/environments/production.rb`

This is an example of simple configuration:

```ruby
module Rack
  class Attack
    throttle('req/ip', limit: 300, period: 5.minutes) do |req|
      req.ip unless req.path.start_with?('/assets')
    end

    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      req.ip if req.path == '/admin/login' && req.post?
    end

    blocklist('bad-robots') do |req|
      req.ip if /\S+\.php/.match?(req.path)
    end
  end
end
```
