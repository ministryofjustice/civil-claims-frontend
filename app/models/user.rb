class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri 

  def self.profile
    # TODO: why does activeresource hate me?
    user = find(:one, from: "/repossession_claims_api/v1/user")
    user.profile.attributes
  end

  class << self
    def headers= headers
      @headers = headers
    end
  end
end
