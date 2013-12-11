class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri 

  def self.profile
    find(:one, from: "#{User.site}/user")
  end
end
