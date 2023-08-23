Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  %w[
    incognito
    disable-extensions
    auto-open-devtools-for-tabs
    window-size=1280,800
  ].each { options.add_argument _1 }

  %w[
    headless
    disable-gpu
  ].each { options.add_argument _1 } if %w[1 on true].include?(ENV['HEADLESS'])

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome_headless
