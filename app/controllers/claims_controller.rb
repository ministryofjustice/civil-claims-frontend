class ClaimsController < ApplicationController
  def new
    Rails.logger.debug "Parameters are: #{params}"
    @page_title = 'Step 1 - Personal details'
    empty_claim = {
      "property" => {},
      "tenants" => [
        {}, {}, {}, {}
      ],
      "landlord" => {}
    }
    @claim = Claim.new empty_claim
    render 'step1', :layout => 'application-claims'
  end

  def create
    Rails.logger.debug "Parameters are: #{params}"
    Rails.logger.debug 'Calling Backend-Api ...'
    @claim = Claim.create(claim_params)
    render 'step1', :layout => 'application-claims'
  end

  private

  def claim_params
    params.require(:claim).permit!
  end
end
