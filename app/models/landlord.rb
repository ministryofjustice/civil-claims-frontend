class Landlord < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  def address
    "#{self.street}<br>#{self.town}<br>#{self.postcode}".gsub('\n', "<br>")
  end

  schema do
    integer 'id'

    string 'organisation_name'
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
