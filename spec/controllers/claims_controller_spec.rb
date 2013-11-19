require 'spec_helper'

unless ENV['SKIP_INTEGRATION_TEST']

  describe ClaimsController do
    let(:valid_attributes) { {street: "102"} }
    let(:valid_session) { {} }

    describe "GET new" do
      it "assigns a new property as @property" do
        VCR.use_cassette('property') do
          get :new, {}, valid_session
        end
        assigns(:property).should be_a_new(Property)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a Property" do
          VCR.use_cassette('property') do
            post :create, {:property => valid_attributes}, valid_session
          end
          assigns(:property).should be_a(Property)
        end

        it "assigns a newly created property as @property" do
          VCR.use_cassette('property') do
            post :create, {:property => valid_attributes}, valid_session
          end
          assigns(:property).should be_persisted
        end
      end
    end
  end

end
