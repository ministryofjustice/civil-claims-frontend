class Claim < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  #has_many :landlords
  #has_one :property
  #has_many :tenants

  schema do
    integer 'id'
  end

  def initialize(*args)
    # ActiveResource hack.
    args[0] ||= {}
    args[0] = {
      :property => Property.new,
      :landlords => [Landlord.new],
      :tenants => [Tenant.new,Tenant.new,Tenant.new,Tenant.new],
      :case_details => CaseDetails.new
    }.merge(args[0])
    super(*args)
  end

end
