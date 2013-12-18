class Property < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  def address
    "#{self.street}<br>#{self.town}<br>#{self.postcode}".gsub('\n', "<br>")
  end
  
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
