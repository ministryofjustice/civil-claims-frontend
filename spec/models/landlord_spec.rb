require 'spec_helper'

describe Landlord do
  let(:the_landlord) do
    json = {
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
    }
    Landlord.new(json)
  end

  subject { the_landlord }

  it { should respond_to :company_name }
  it { should respond_to :street }
  it { should respond_to :town }
  it { should respond_to :postcode }

  it { should respond_to :title }
  it { should respond_to :full_name }
  it { should respond_to :phone }
  it { should respond_to :mobile }
  it { should respond_to :email }

  it { should respond_to :dx_number }
  it { should respond_to :dx_exchange }

  it { should respond_to :id }
  it { should respond_to :repossession_claim_id }
end
