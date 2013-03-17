require "racktest_cookie_disabler/version"

module RackTestCookieDisabler
  autoload :Middleware, 'racktest_cookie_disabler/middleware'
  class <<self
    attr_accessor :cookies_disabled

  end
end
