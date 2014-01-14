class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri 

  def self.profile
    user = find(:one, from: "#{User.site}/user")
    user.profile.attributes
  end

  class << self
    def headers= headers
      @headers = headers
    end
  end
end
