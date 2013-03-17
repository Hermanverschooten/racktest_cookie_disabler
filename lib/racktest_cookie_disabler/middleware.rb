module RackTestCookieDisabler
  class Middleware
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      if env['CAPYBARA_DISABLE_COOKIES']
          env.delete('HTTP_COOKIE')
      end
      @app.call(env)
    end
  end
end
