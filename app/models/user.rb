class User < ActiveResource::Base
  self.site = Rails.configuration.api_uri
  has_one :landlord, as: :profile

  schema do
    string user_id

  end
end
