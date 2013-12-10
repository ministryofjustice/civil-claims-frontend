class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri 
end
