# Rack CORS

* [Rack Cors](https://github.com/cyu/rack-cors). Add the following gem:

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