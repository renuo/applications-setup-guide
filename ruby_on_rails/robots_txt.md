# robots.txt

It is time to configure the robots.txt file properly, to avoid crawlers to find our develop and testing environments.
Since we have three environments, we want to allow only one to be reachable.

Rails creates automatically a `robots.txt` file in the public folder.
If the project doesn't have one, add it with an empty content.
This will be the file used in the `master` branch, and it allows the website to be accessed entirely.
When we want to adapt the robots.txt for our production environment, we will manipulate this file.

For the other environments we will respond to a call to `robots.txt` through a middleware, that will be enabled through
an environment variable, and that will override our original `robots.txt` file.

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

Add the variable `BLOCK_ROBOTS=true` in your develop and testing environment on Heroku

```sh
heroku config:add BLOCK_ROBOTS=true --app [project-name]-testing
heroku config:add BLOCK_ROBOTS=true --app [project-name]-develop
```
