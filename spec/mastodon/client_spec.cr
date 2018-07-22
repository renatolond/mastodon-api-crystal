require "../spec_helper"

def subject
  object = Mastodon::Client.new(base_url: "https://mastodon.social", bearer_token: "123456")
end
describe Mastodon::Client do

  describe "#user_agent" do
    it "returns the user agent string" do
      subject.user_agent.should match(/MastodonCrystalGem/)
    end
  end

  describe "#bearer_token" do
    it "returns configured bearer token" do
      subject.bearer_token.should eq "123456"
    end
  end

  describe "#base_url" do
    it "returns configured base URL" do
      subject.base_url.should eq "https://mastodon.social"
    end
  end

  describe "#timeout" do
    it "returns the configured timeout" do
      expected_timeout = {connect:  2, read: 9, write: 20}
      Mastodon::Client.new(base_url: "https://mastodon.social", bearer_token: "123456", timeout: {read: 9}).timeout.should eq expected_timeout
    end
  end
end
