# frozen_string_literal: true

if defined?(Raven)
  Raven.configure do |config|
    config.processors -= [Raven::Processor::PostData]
  end
end
