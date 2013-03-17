require 'capybara/rspec'
require "racktest_cookie_disabler"
require "racktest_cookie_disabler/capybara"
require "capybara/mechanize"

Dir[File.expand_path('../../apps/*.rb', __FILE__)].each do |f|
  require f
end

TestRailsApp::Application.configure do |app|
  app.middleware.insert_after Rack::Lock, RackTestCookieDisabler::Middleware
end
