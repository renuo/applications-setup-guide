# frozen_string_literal: true

if defined? Sentry
  Sentry.init do |config|
    filter = ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters)
    config.before_send = lambda do |event, _hint|
      filter.filter(event.to_hash)
    end
  end
end
