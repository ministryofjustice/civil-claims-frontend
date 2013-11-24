class Claim < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  has_one  :property
  has_one  :landlord
  has_many :tenants

  schema do
    integer 'id'
  end

  # This is important because it triggers the collection functionality for fields_for
  # ActiveResource does not implement 'accept_nested_attributes_for :tenants'
  def tenants_attributes=(attributes)
  end
end
