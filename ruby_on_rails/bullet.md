# Bullet

We don't like N+1 queries. Nobody does.
If you don't know what we are talking about,
please read [this article](https://www.sitepoint.com/silver-bullet-n1-problem/) that explains it pretty well.

In order to identify possible N+1 queries, we use the gem [`bullet`](https://github.com/flyerhzm/bullet).

Please add the gem to both `development` and `test` group of the Gemfile since we'll use it also in our tests.

Those are our favourite configurations:

* in development we enable it and we see the issues both a footer in the page and also in the logs

```ruby
# config/environments/development.rb

config.after_initialize do
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.add_footer = true
end
```

* in test we enable it and raise an exception in case a N+1 is identified (or an unused eager loading)

```ruby
# config/environments/test.rb

config.after_initialize do
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.raise = true
end
```
