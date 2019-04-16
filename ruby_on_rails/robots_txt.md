# robots.txt

It is time to configure the `robots.txt` file properly, to avoid crawlers to find our develop and testing environments.
The master environment should be the only one searchable in the end.

Make sure that there is a `robots.txt` file in the public folder or your project (Rails should have created it).
This file will only be used in environments where the `BLOCK_ROBOTS` environment variable is not set.
If it is set then a custom middleware catches calls to `/robots.txt`

Add the following gem:

```ruby
group :production do
  gem 'norobots'
end
```

Add the variable `BLOCK_ROBOTS=true` in your develop and testing environments on Heroku:

```sh
heroku config:add BLOCK_ROBOTS=true --app [project-name]-testing
heroku config:add BLOCK_ROBOTS=true --app [project-name]-develop
```
