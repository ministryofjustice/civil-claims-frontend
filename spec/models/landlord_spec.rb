require 'spec_helper'

describe Landlord do

  before(:each) do
    @landlord = FactoryGirl.build(:landlord)
  end

  subject{ @landlord }

  it { should respond_to :organisation_name }
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
  it { should_not respond_to :repossession_claim_id }

end
