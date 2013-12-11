require 'spec_helper'

describe Claim do
  before(:each) do
    VCR.use_cassette('create_new_claim') do
      @claim = FactoryGirl.build(:claim)
      @claim.landlords << FactoryGirl.build(:landlord)
      @claim.tenants << FactoryGirl.build(:tenant)
      @claim.save
    end
  end

  subject { @claim }
  it { should respond_to :id }
  it { should respond_to :property }
  it { should respond_to :landlords }
  it { should respond_to :tenants }

  it 'can be saved and retrieved' do
    VCR.use_cassette('find_claim') { @result = Claim.find(@claim.id) }
    expect( @result.to_json ).to eql @claim.to_json
  end

end
