class Tenant  < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  schema do
    integer 'id'

    string 'title'
    string 'full_name'
    string 'phone'
    string 'mobile'
    string 'email'

    string 'street'
    string 'town'
    string 'postcode'
  end
end
