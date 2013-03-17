# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'racktest_cookie_disabler/version'

Gem::Specification.new do |gem|
  gem.name          = "racktest_cookie_disabler"
  gem.version       = RackTestCookieDisabler::VERSION
  gem.authors       = ["Herman verschooten"]
  gem.email         = ["Herman@verschooten.net"]
  gem.description   = %q{Disable cookies for RackTest}
  gem.summary       = %q{Helper for capybara that allows you to test without cookies enabled.}
  gem.homepage      = "https://github.com/Hermanverschooten/racktest_cookie_disabler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec', '2.12.0'
  gem.add_development_dependency 'capybara', '1.1.4'
  gem.add_development_dependency 'capybara-mechanize'
  gem .add_development_dependency'rails', '3.2.12'

end
