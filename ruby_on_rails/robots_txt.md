# robots.txt

It is time to configure the `robots.txt` file properly, to avoid crawlers to find our develop and testing environments.
The master environment should be the only one searchable in the end.

Make sure that there is a `robots.txt` file in the public folder or your project (Rails should have created it).
This file will only be used in environments where the `BLOCK_ROBOTS` environment variable is not set. If it is set then a custom middleware catches calls to `/robots.txt`

Create the following file:

```ruby
# app/middleware/robots_txt.rb

class RobotsTxt
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/robots.txt' && ENV['BLOCK_ROBOTS'].present?
      [200, { 'Content-Type' => 'text/plain' }, ["User-Agent: *\nDisallow: /"]]
    else
      @app.call(env)
    end
  end
end
```

Add the following to `config/application.rb`:

```ruby
config.middleware.insert_before Rack::Sendfile, 'RobotsTxt' if ENV['BLOCK_ROBOTS'].present?
```

Add the variable `BLOCK_ROBOTS=true` in your develop and testing environment on Heroku:

```sh
heroku config:add BLOCK_ROBOTS=true --app [project-name]-testing
heroku config:add BLOCK_ROBOTS=true --app [project-name]-develop
```
