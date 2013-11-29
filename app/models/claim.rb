class Claim < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  schema do
    integer 'id'
  end

end
