class ClaimsController < ApplicationController
  def new
    Rails.logger.debug "Parameters are: #{params}"
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.new
    @claim.property = Property.new
    @claim.landlord = Landlord.new
    render 'step1', :layout => 'application-claims'
  end

  def create
    Rails.logger.debug "Parameters are: #{params}"
    #@claim = nil
    #begin
    Rails.logger.debug 'Calling backend-api'
    @claim = Claim.create(claim_params)

    #rescue StandardError => e
    #  Rails.logger.error "Error " + e.to_s
    #end
    render 'step1', :layout => 'application-claims'
  end

  private

  def claim_params
    params.require(:claim).permit!
  end
end
