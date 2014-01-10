class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri 

  def self.profile
    puts "#{User.site}/user"
    find(:one, from: "#{User.site}/user")
  end

  class << self
    def headers= headers
      @headers = headers
    end
  end
end
