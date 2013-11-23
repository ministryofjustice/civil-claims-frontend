require 'spec_helper'

describe Tenant do
  let(:the_tenant) do
    json = {
      "street" => "103",
      "town" => "Bristol",
      "postcode" => "N2 2QX",
      "id" => 87,
      "repossession_claim_id" => nil,
      "title" => 'Miss',
      "full_name" => 'Catty Asshh',
      "phone" => '07 254 121 232',
      "mobile" => '932 29 22',
      "email" => 'bristol@gov.uk',
      "dx_number" => 'dx 23626',
      "dx_exchange" => 'ex 282'
    }
    Tenant.new(json)
  end

  subject { the_tenant }

  it { should respond_to :title }
  it { should respond_to :full_name }
  it { should respond_to :phone }
  it { should respond_to :mobile }
  it { should respond_to :email }

  it { should respond_to :street }
  it { should respond_to :town }
  it { should respond_to :postcode }

  it { should respond_to :id }
  it { should respond_to :repossession_claim_id }
end
