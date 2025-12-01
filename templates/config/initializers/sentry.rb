# frozen_string_literal: true

require 'active_support/parameter_filter'

if defined? Sentry
  Sentry.init do |config|
    filter = ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters)
    config.before_send = lambda do |event, _hint|
      if event.extra
        event.extra = filter.filter(event.extra)
      end

      if event.user
        event.user = filter.filter(event.user)
      end

      if event.contexts
        event.contexts = filter.filter(event.contexts)
      end

      event
    end

    config.breadcrumbs_logger = %i[sentry_logger active_support_logger http_logger]
  end
end
