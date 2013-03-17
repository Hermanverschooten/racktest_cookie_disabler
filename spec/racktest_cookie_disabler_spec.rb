require "spec_helper"

describe RackTestCookieDisabler do
  subject {described_class}

  describe ".disable_cookies" do

    it "has a cookies_disabled attribute" do
      subject.respond_to?(:cookies_disabled).should be true
      subject.respond_to?(:cookies_disabled=).should be true
    end
  end
end
