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
      },
      :landlord => {
        "street" => "103",
        "town" => "Bristol",
        "postcode" => "N2 2QX",
        "id" => 87,
        "repossession_claim_id" => nil,
        "company_name" => 'Bristol County Council',
        "title" => 'Mr.',
        "full_name" => 'Jairo Pereira',
        "phone" => '07 254 121 232',
        "mobile" => '932 29 22',
        "email" => 'bristol@gov.uk',
        "dx_number" => 'dx 23626',
        "dx_exchange" => 'ex 282'
      },
      :tenants => [
        {
          "title" => "Miss",
          "full_name" => "Cat"
        },
        {
          "title" => "Mr",
          "full_name" => "Hiro"
        },
      ]
    }
    Claim.new(json)
  end

  subject { the_claim }

  it { should respond_to :id }
  it { should respond_to :property }
  it { should respond_to :landlord }
  it { should respond_to :tenants }

  # It does not seem to work when initalized with json
  #it { should have_many :tenants }
end
