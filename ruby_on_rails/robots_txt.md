# robots.txt

It is time to configure the `robots.txt` file properly, to avoid crawlers to find our develop environments.
The main environment should be the only one searchable in the end.

Make sure that there is a `robots.txt` file in the public folder or your project (Rails should have created it).
This file will only be used in environments where the `BLOCK_ROBOTS` environment variable is not set.
If it is set then a custom middleware catches calls to `/robots.txt`

Add the following gem:

```ruby
group :production do
  gem "norobots"
end
```

## Setting Environment Variables

### Heroku

Add the environment variable `BLOCK_ROBOTS=true` in your develop environment:

```sh
heroku config:add BLOCK_ROBOTS=true --app [project-name]-develop
```

### Deploio

Set the environment variable using:

```sh
nctl update app [app-name] --env=BLOCK_ROBOTS=true --project=[project-name]
```
