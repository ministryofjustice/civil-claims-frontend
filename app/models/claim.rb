class Claim < ActiveResource::Base
  self.site = Rails.configuration.api_uri

  has_many :landlords
  has_one :property
  has_many :tenants
  has_one :case_detail

  schema do
    integer 'id'
    boolean 'statement_of_truth'
  end

  def initialize(*args)
    # ActiveResource hack.
    args[0] ||= {}
    args[0] = {
      :property => {},
      :landlords => [],
      :tenants => [],
      :case_detail => {}
    }.merge(args[0])
    super(*args)
  end

  class << self
    def headers= headers
      @headers = headers
    end
  end
end
