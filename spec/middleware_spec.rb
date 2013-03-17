require "spec_helper"

shared_examples "common scenarios" do
  context "rails application" do
    background { Capybara.app = TestRailsApp::Application}
    scenario "with cookies enabled" do
      page.visit '/'
      page.should have_content "Cookie found"
    end
    scenario "with cookies disabled" do
      page.disable_cookies(true)
      page.visit '/'
      page.should have_content "Cookie not found"
    end
  end
end

feature "manage rack session", %q(
  As a developer
  I want to have ability to test my app with or without cookies
) do
  context ":rack_test driver", :driver => :rack_test do
    include_examples "common scenarios"
  end
  context ":mechanize driver", :driver => :mechanize do
    include_examples "common scenarios"
  end
end
