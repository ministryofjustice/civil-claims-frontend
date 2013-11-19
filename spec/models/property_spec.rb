require 'spec_helper'

describe Property do
  let(:the_property) do
    json = {
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
    Property.new(json)
  end

  subject { the_property }

  it { should respond_to :street }
  it { should respond_to :town }
  it { should respond_to :postcode }
  it { should respond_to :id }
  it { should respond_to :residential }
  it { should respond_to :commercial }
  it { should respond_to :resident_type }
  it { should respond_to :land_registry_title_number }
  it { should respond_to :repossession_claim_id }
end
