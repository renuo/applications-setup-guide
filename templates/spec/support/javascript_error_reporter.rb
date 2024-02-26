# frozen_string_literal: true

module JavaScriptErrorReporter
  RSpec.configure do |config|
    config.after(:each, :js, type: :system) do
      errors = page.driver.browser.logs.get(:browser)

      aggregate_failures 'javascript errors' do
        errors.each do |error|
          expect(error.level).not_to eq('SEVERE'), error.message

          next unless error.level == 'WARNING'

          warn "\e[33m\nJAVASCRIPT WARNING\n#{error.message}\e[0m"
        end
      end
    end
  end
end
