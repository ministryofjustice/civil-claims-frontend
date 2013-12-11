require 'spec_helper'

describe ClaimsController do
  def claim_to_attribute_hash(claim)
    attributes = claim.attributes
    attributes[:property] = claim.property.attributes
    attributes[:landlords] = claim.landlords.map { |l| l.attributes }
    attributes[:tenants] = claim.tenants.map { |t| t.attributes }
    attributes
  end

  def create_claim
    VCR.use_cassette('create_new_claim') { post :create, {:claim => valid_attributes} }
    assigns(:claim)
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
      @claim = create_claim
    end

    it "persists the claim" do
      @claim.id.should_not be_nil
      @claim.should be_a Claim
      @claim.should be_persisted
    end
    it "redirects to the claim" do
      expect(response).to redirect_to @claim
    end
  end

  describe "POST update" do
    before :each do
      claim = create_claim
      VCR.use_cassette('update_claim') do
        claim_attr = claim_to_attribute_hash(claim)
        claim_attr[:property][:street] = '123 test st'
        patch :update, {:id => claim_attr[:id], :claim => claim_attr }
      end
    end

    it 'updates the claim' do
      expect(assigns(:claim).property.street).to eql '123 test st'
    end
    it 'redirects to the claim' do
      expect(response).to redirect_to assigns(:claim)
    end
  end

  describe "PUT update" do
    before :each do
      claim = create_claim
      VCR.use_cassette('update_claim') do
        claim_attr = claim_to_attribute_hash(claim)
        claim_attr[:property][:street] = '123 test st'
        patch :update, {:id => claim_attr[:id], :claim => claim_attr }
      end
    end

    it 'updates the claim' do
      expect(assigns(:claim).property.street).to eql '123 test st'
    end
    it 'redirects to the claim' do
      expect(response).to redirect_to assigns(:claim)
    end
  end

  describe "PATCH update" do
    before :each do
      claim = create_claim
      VCR.use_cassette('update_claim') do
        claim_attr = claim_to_attribute_hash(claim)
        claim_attr[:property][:street] = '123 test st'
        patch :update, {:id => claim_attr[:id], :claim => claim_attr }
      end
    end

    it 'updates the claim' do
      expect(assigns(:claim).property.street).to eql '123 test st'
    end
    it 'redirects to the claim' do
      expect(response).to redirect_to assigns(:claim)
    end
  end  

  describe 'GET edit' do
    before :each do 
      VCR.use_cassette('create_new_claim2') { post :create, {:claim => valid_attributes} }
      VCR.use_cassette('find_claim2') { get :edit, {:id => assigns(:claim).id} }
      @claim = assigns(:claim)
    end

    it 'finds the specified claim' do
      expect(@claim).to be_a Claim
      expect(@claim.id).to_not be_nil
    end

    it 'redirects /claims/:id to /claims:id/personal_details' do
      expect(response.status).to eql 302
      expect(response.location).to include "/claims/#{@claim.id}/personal_details"
    end
  end

  describe 'DELETE delete' do
    before :each do 
      @claim = create_claim
    end

    it 'deletes the specified resource' do
      VCR.use_cassette('delete_claim_2') do
        delete :destroy, {:id => @claim.id} 
      end
      expect { VCR.use_cassette('find_missing_claim') { get :edit, {:id => @claim.id} } }.to raise_error ActiveResource::ResourceNotFound
    end
  end
end
