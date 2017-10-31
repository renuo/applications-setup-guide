# Sidekiq

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

* create file `config/sidekiq.yml`

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
    * Install Redis `brew install redis`
    * Start Redis `redis-server`
    * Start Sidekiq `bundle exec sidekiq -C config/sidekiq.yml`   
    * Start your server


## Sidekiq cron
If the Heroku scheduler doesn't fit your needs, you can add extended capabilities
with the Sidekiq cron gem

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

* create file `config/schedule.yml`

```yml
MyExampleJob:
  cron: "*/5 * * * *"
  class: "MyJob"
  queue: default
```