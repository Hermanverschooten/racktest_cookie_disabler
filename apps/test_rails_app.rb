require 'action_controller/railtie'

module TestRailsApp
  class Application < Rails::Application
    config.secret_token = '572c86f5ede338bd8aba8dae0fd3a326aabababc98d1e6ce34b9f5'
    if Rails::VERSION::MAJOR > 3
      config.secret_key_base = '6dfb795086781f017c63cadcd2653fac40967ac60f621e6299a0d6d811417156d81efcdf1d234c'
    end

    routes.draw do
      get  '/'   => 'test_rails_app/sessions#new'
      get '/test_cookie' => 'test_rails_app/sessions#test_cookie'
    end
  end

  class SessionsController < ActionController::Base
    def new
      if cookies['cookie_test'].blank?
        cookies['cookie_test'] = Time.now
        redirect_to('/test_cookie')
      else
        render :text => "Cookie found"
      end
    end

    def test_cookie
      if cookies['cookie_test'].blank?
        render :text => "Cookie not found"
      else
        render :text => "Cookie found"
      end
    end
  end
end

Rails.logger = Logger.new('/dev/null')
