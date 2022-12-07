# Sidekiq

As soon as you have to do work with background jobs please follow those suggestions.
They will help you having a proper system to do background work.
We use [sidekiq](https://github.com/mperham/sidekiq) because it works well on Heroku and is easy to setup (suckerpunch for example causes memory issues on Heroku).

* Add the following gem `gem 'sidekiq'` to the `production` block and install it

  ```sh
  bundle install
  ```

* Update the `Procfile` and set the `worker` line, so it looks like this:

  ```rb
  web: bundle exec puma -C config/puma.rb
  worker: bundle exec sidekiq -C config/sidekiq.yml
  ```

* Configure the active job adapter in `config/environments/production.rb`

  ```rb
  config.active_job.queue_adapter = :sidekiq
  ```

* Configure the active job adapter in `config/environments/development.rb`

  ```rb
  config.active_job.queue_adapter = :async
  ```

* Configure the active job adapter in `config/environments/test.rb`

  ```rb
  config.active_job.queue_adapter = :test
  ```

* Create a file `config/sidekiq.yml`, there you can setup your options for sidekiq.
  It could look something like this.
  You may need to inform yourself about what
  [queue configuration](https://github.com/mperham/sidekiq/wiki/Advanced-Options#queues)
  is right for your project.

  ```yml
  :concurrency: <%= ENV["SIDEKIQ_CONCURRENCY"] || 5 %>
  :queues:
    - [mailers, 1]
    - [default, 1]
  ```

  Note: if you are on the free Redis plan
  you may need to limit your concurrency to not exceed the connection limit.

* On Heroku you need to:
  * Add the Heroku [Redis addon](https://elements.heroku.com/addons/heroku-redis)
  * And to start it turn on the worker

* To run Sidekiq locally you need to:
  * Temporarily switch the adapter in `config/environments/development.rb` to
    ```rb
    config.active_job.queue_adapter = :sidekiq
    ```
  * Install Redis if not yet installed `brew install redis`
  * Start Redis `redis-server`
  * Start Sidekiq `bundle exec sidekiq -C config/sidekiq.yml`
  * Start your server

## Sidekiq-Cron

If you need finer graded control about your scheduled jobs than the Heroku scheduler
provides you, you can use [Sidekiq-Cron](https://github.com/ondrejbartas/sidekiq-cron).
This way you can for example schedule a job every minute.

* Add the following gem `gem 'sidekiq-cron'` and install it

  ```sh
  bundle install
  ```

* update/create `config/initializers/sidekiq.rb` and add the following lines:

  ```rb
  if defined? Sidekiq
    schedule_file = 'config/schedule.yml'

    if File.exist?(schedule_file) && Sidekiq.server?
      errors = Sidekiq::Cron::Job.load_from_hash!(YAML.load_file(schedule_file))
      Rails.logger.error "Errors loading scheduled jobs: #{errors}" if errors.any?
    end
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

## Sidekiq monitoring

If you want to provide a sidekiq dashboard and see which tasks failed or run through, you can use the [Sidekiq monitoring](https://github.com/mperham/sidekiq/wiki/Monitoring):

* Update/Create `config/initializers/sidekiq.rb` and add the following lines:

  ```rb
  if defined? Sidekiq
    require 'sidekiq/web'

    Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
      [user, password] == [ENV['SIDEKIQ_USER'], ENV['SIDEKIQ_PASSWORD']]
    end
  end
  ```

* Add `SIDEKIQ_USER` and `SIDEKIQ_PASSWORD` as the credentials to the dashboard to your `application.example.yml`.
* Add the following line inside `routes.rb`:

  ```rb
  Rails.application.routes.draw do
    ...
    mount Sidekiq::Web => '/sidekiq' if defined? Sidekiq::Web
    ...
  ```
  
### Error monitoring
  
In order to report messages, exceptions or to trace events, it is recommended to install the `sentry-sidekiq` gem. 
