require "../../spec_helper"

def client
  Mastodon::Client.new(base_url: "https://mastodon.social", bearer_token: "123456")
end

describe Mastodon::REST::Accounts do
  describe "#verify_credentials" do
    Spec.before_each do
      WebMock.stub(:get, "https://mastodon.social/api/v1/accounts/verify_credentials").to_return(fixture("verify_credentials.json"))
    end

    it "returns logged in user's account" do
      account = client.verify_credentials
      expect(account).to be_a Mastodon::Account
      expect(account.username).to eq "Gargron"
    end
  end
end
