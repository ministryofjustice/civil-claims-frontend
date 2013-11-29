require 'spec_helper'

describe Claim do
  before(:each) do
    VCR.use_cassette('new_claim123') do
      @claim = FactoryGirl.build(:claim)
      @claim.landlords << FactoryGirl.build(:landlord)
      @claim.tenants << FactoryGirl.build(:tenant)
    end
    @claim.save
  end

  subject { @claim }

  it { should respond_to :id }
  it { should respond_to :property }
  it { should respond_to :landlords }
  it { should respond_to :tenants }

  it 'can be saved and retrieved' do
    expect( Claim.find(@claim.id).to_json ).to eql @claim.to_json
  end
end
