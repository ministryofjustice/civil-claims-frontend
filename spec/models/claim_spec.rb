require 'spec_helper'

describe Claim do
  let(:the_claim) do
    json = {
      :id => "1",
      :property => {
        "street" => "102",
        "town" => "Westminster",
        "postcode" => "SW1H 9AJ",
        "id" => 87,
        "residential" => true,
        "commercial" => true,
        "resident_type" => "Tenants",
        "land_registry_title_number" => "26736736",
        "repossession_claim_id" => nil
      }
    }
    Claim.new(json)
  end

  subject { the_claim }

  it { should respond_to :id }
  it { should respond_to :property }
  # It does not seem to work when initalized with json
  # it { should have_one :property }
end
