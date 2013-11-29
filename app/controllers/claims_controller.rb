class ClaimsController < ApplicationController
  def new
    @page_title = 'Step 1 - Personal details'
    @claim = Presenters::Claim::SocialLandlord.new
    render 'step1', :layout => 'application-claims'
  end

  def create
    @claim = Presenters::Claim::SocialLandlord.create(claim_params)
    render 'step1', :layout => 'application-claims'
  end

  private

  def claim_params
    # 'tenants_attributes' would appear as a parameter when using fields_for
    # on the front-end without a flag 'include_id: false'
    params.require(:claim).permit!.except(:tenants_attributes)
  end
end
