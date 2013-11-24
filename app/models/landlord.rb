class Landlord < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  schema do
    integer 'id'

    string 'company_name'
    string 'street'
    string 'town'
    string 'postcode'

    string 'title'
    string 'full_name'
    string 'phone'
    string 'mobile'
    string 'email'

    string 'dx_number'
    string 'dx_exchange'
  end
end
