require 'spec_helper'

describe ClaimsController do
  let(:valid_attributes) do 
    claim = FactoryGirl.build(:claim).attributes
    claim[:property] = FactoryGirl.build(:property).attributes
    claim[:landlords] = [FactoryGirl.build(:landlord).attributes]
    claim[:tenants] = [FactoryGirl.build(:tenant).attributes]
    claim[:tenants] << FactoryGirl.build(:tenant).attributes
    claim
  end
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new Claim as @claim" do
      VCR.use_cassette('claim') do
        get :new, {}, valid_session
      end
      assigns(:claim).should be_a(Claim)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a Claim" do
        VCR.use_cassette('claim_from_factory') do
          post :create, {:claim => valid_attributes}, valid_session
        end
        assigns(:claim).should be_a(Claim)
        assigns(:claim).should be_persisted
        expect(response).to redirect_to "/claim/#{assigns[:claim].id}"
      end
    end
  end
end
