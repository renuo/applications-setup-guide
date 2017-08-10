# Ruby On Rails - API Only

If you follow this guide it means that you are going to build an API only application with Ruby On Rails and all the Frontend part of your app is in another project.
There are some important differences between a Standard Ruby On Rails Application and an API Only one:
first of all you are going to configure a Monorepo where both your Frontend and Backend applications will be maintained and then we suggest you to follow this guide as part of the Monorepo Setup Guide.

TODO: for now this guide contains just some parts which are valid in API Only applications

1. [Rack Cors](https://github.com/cyu/rack-cors)

   * Add the following gem:
```ruby
gem 'rack-cors', require: 'rack/cors'
```

   * Add in `config/environments/production.rb`

```ruby
config.middleware.insert_before 0, 'Rack::Cors' do
  allow do
    origins '*'
    resource '/assets/*', headers: :any, methods: %i(get options)
  end
end
```