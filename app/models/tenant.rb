class Tenant  < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  belongs_to :claim

  def address
    "#{self.street}<br>#{self.town}<br>#{self.postcode}".gsub('\n', "<br>")
  end

  def display_name
    "#{title} #{full_name}".strip
  end

  def blank?
    self.attributes.inject(true) { |state, attr| state = false unless attr[1].blank? }
  end

  schema do
    integer 'id'

    string 'title'
    string 'full_name'
    string 'phone'
    string 'email'

    string 'street'
    string 'town'
    string 'postcode'
  end
end
