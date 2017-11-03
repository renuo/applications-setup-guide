# Sidekiq

As soon as you have to do work with background jobs please follow those suggestions.
They will help you having a proper system to do background work.
We use [sidekiq](https://github.com/mperham/sidekiq) because it works well on Heroku and is easy to setup (suckerpunch for example causes memory issues on Heroku).

* Add the following gem `gem 'sidekiq'` and install it

```sh
bundle install
```

* update the `Procfile` and set the `worker` line, so it looks like this:

```rb
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml
```

* configure the active job adapter in `config/environments/production.rb`

```rb
config.active_job.queue_adapter = :sidekiq
```

* configure the active job adapter in `config/environments/development.rb`

```rb
config.active_job.queue_adapter = :inline
```

* configure the active job adapter in `config/environments/test.rb`

```rb
config.active_job.queue_adapter = :test
```

* create a file `config/sidekiq.yml`, there you can setup your options for sidekiq.
It could look something like this.
(For more options, see the [Wiki](https://github.com/mperham/sidekiq/wiki/Getting-Started) of the gem)
Note: if you are on the free Redis plan
you may need to limit your concurrency to not exceed the connection limit.

```yml
:concurrency: 3
:queues:
 - [mailers, 1]
 - [default, 1]
```

* on Heroku you need to:
  * Add the Heroku [Redis addon](https://elements.heroku.com/addons/heroku-redis)
  * Add env variable `REDIS_PROVIDER` = `REDIS_URL`
  * And to start it turn on the worker

* to run it locally you need to:
  * Install Redis if not yet installed `brew install redis`
  * Start Redis `redis-server`
  * Start Sidekiq `bundle exec sidekiq -C config/sidekiq.yml`
  * Start your server

## Sidekiq cron

If you need finer graded control about your scheduled jobs than the Heroku scheduler
provides you, you can use [Sidekiq cron](https://github.com/ondrejbartas/sidekiq-cron).
This way you can for example schedule a job every minute.

* Add the following gem `gem 'sidekiq-cron'` and install it

```sh
bundle install
```

* update/create `config/initializers/sidekiq.rb` and add the following lines:

```rb
schedule_file = 'config/schedule.yml'

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
```

* create file `config/schedule.yml`. There you can specify your jobs.
A simple job which runs every 5 minutes could look something like this.
(For more options, see the [Readme](https://github.com/ondrejbartas/sidekiq-cron/blob/master/README.md) of the gem)

```yml
MyExampleJob:
  cron: "*/5 * * * *"
  class: "MyJob"
  queue: default
```