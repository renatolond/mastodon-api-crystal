module Mastodon
  class Client
    getter bearer_token : String
    getter base_url : String
    DEFAULT_TIMEOUT = {
      connect: 2,
      read: 5,
      write: 20,
    }
    @timeout = DEFAULT_TIMEOUT
    getter timeout

    def initialize(@base_url : String, @bearer_token : String, timeout = DEFAULT_TIMEOUT )
      @timeout = @timeout.merge(timeout)
    end

    # User agent of the client
    # @return [String]
    def user_agent
      @user_agent ||= "MastodonCrystalGem/#{Mastodon::Version.to_s}"
    end
  end
end
