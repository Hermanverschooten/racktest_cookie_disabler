module RackTestCookieDisabler
  module Capybara
    def disable_cookies(disable)
      add_header('CAPYBARA_DISABLE_COOKIES',disable)
    end

    def add_header(key,value)
      current_headers = driver.browser.options[:headers] || {}
      current_headers[key] =value
      driver.browser.options[:headers]=current_headers
    end
  end
end

require 'capybara/session'
Capybara::Session.send :include, RackTestCookieDisabler::Capybara

