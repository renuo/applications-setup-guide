if Rails.env.production?
  require 'raven'

  Raven.configure do |config|
    config.environments = %w[production]
    config.dsn = ENV['SENTRY_DSN']
  end
end
