# RackTestCookieDisabler

When you are testing a web app it is sometiimes necessary to be able to disable cookies to emulate what happens when
someone whose cookies are disabled uses your app.  This gem allows you to disable cookies when using capybara to test your web app.
It only works for RackTest or RackTest-based drivers such as Mechanize.

## Installation

Add this line to your application's Gemfile:

    gem 'racktest_cookie_disabler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install racktest_cookie_disabler

## Usage

Add RackTestCookieDisabler middleware to rails middleware stack.
Add the following in`config/environments/test.rb`:
```ruby
    [MyRailsApp]::Application.configure do
      ...
      # Add cookie disabler middleware
      config.middleware.insert_after Rack::Lock, RackTestCookieDisabler::Middleware
      ...
    end
```
*Note* Ensure you include racktest_cookie_disabler middleware only for *test* environment
otherwise you may have issues.

In your spec:

```rspec
    scenario "with cookies disabled" do
      page.disable_cookies(true)
      page.visit '/'
      ...
    end
```

## How does it work

When you call disable_cookies(true) it adds an extra header to your request.
The middleware detects this header and removes the 'HTTP_COOKIE' from the request.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
