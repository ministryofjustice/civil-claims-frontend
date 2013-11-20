require 'spec_helper'

unless ENV['SKIP_INTEGRATION_TEST']

  describe ClaimsController do
    let(:valid_attributes) { { "property" =>
      {
        "street" => "102",
        "town" => "Westminster",
      }
      } }
    let(:valid_session) { {} }

    describe "GET new" do
      it "assigns a new property as @property" do
        VCR.use_cassette('property') do
          get :new, {}, valid_session
        end
        assigns(:claim).should be_a_new(Claim)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a Property" do
          VCR.use_cassette('property') do
            post :create, {:claim => valid_attributes}, valid_session
          end
          assigns(:claim).should be_a(Claim)
        end

        it "assigns a newly created property as @property" do
          VCR.use_cassette('property') do
            post :create, {:claim => valid_attributes}, valid_session
          end
          assigns(:claim).should be_persisted
        end
      end
    end
  end

end
