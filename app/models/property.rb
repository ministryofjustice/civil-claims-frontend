class Property < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  schema do
    integer 'id'

    string 'street'
    string 'town'
    string 'postcode'

    boolean 'residential'
    boolean 'commercial'

    string 'resident_type'
    string 'land_registry_title_number'
  end
end
