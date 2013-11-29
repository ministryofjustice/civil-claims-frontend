require 'spec_helper'

describe ClaimsController do
  def claim_to_attribute_hash(claim)
    attributes = claim.attributes
    attributes[:property] = claim.property.attributes
    attributes[:landlords] = claim.landlords.map { |l| l.attributes }
    attributes[:tenants] = claim.tenants.map { |t| t.attributes }
    attributes
  end

  let(:valid_attributes) do 
    claim_to_attribute_hash(FactoryGirl.build(:claim))
  end

  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new Claim as @claim" do
      get :new, {}, valid_session
      assigns(:claim).should be_a(Claim)
      assigns(:claim).id.should be_nil
    end
  end

  describe "POST create" do
    before :each do 
      VCR.use_cassette('create_new_claim') do
        post :create, {:claim => valid_attributes}
      end
    end

    it "persists the claim" do
      assigns(:claim).id.should_not be_nil
      assigns(:claim).should be_a(Claim)
      assigns(:claim).should be_persisted
    end
    it "redirects to the claim" do
      expect(response).to redirect_to assigns(:claim)
    end
  end

  describe "POST update" do
    before :each do
      VCR.use_cassette('create_new_claim') do
        post :create, {:claim => valid_attributes}
      end
      VCR.use_cassette('update_claim') do
        claim = claim_to_attribute_hash(assigns(:claim))
        claim[:property][:street] = '123 test st'
        post :update, {:id => claim[:id], :claim => claim }
      end
    end

    it 'updates the claim' do
      expect(assigns(:claim).property.street).to eql '123 test st'
    end
    it 'redirects to the claim' do
      expect(response).to redirect_to assigns(:claim)
    end
  end
end
