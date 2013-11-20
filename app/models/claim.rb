class Claim < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  has_one  :property
  #accepts_nested_attributes_for :property

  schema do
    integer 'id'
  end

  def initialize(*args)
    # Make sure we always have associations assigned, so that activeresource doesn't request them
    args[0] ||= {}
    args[0] = {
      :property => nil,
    }.merge(args[0])
    super(*args)
  end
end
