class ClaimsController < ApplicationController
  def new
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.new
    render 'personal_details', :layout => 'application-claims'
  end

  def show
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.find(params[:id])
    render 'personal_details', :layout => 'application-claims'
  end

  def edit
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.find(params[:id])
    render 'personal_details', :layout => 'application-claims'
  end

  def update
    @claim = Claim.find(params[:id])
    @claim.update_attributes(claim_params)
    redirect_to @claim
  end

  def destroy
    Claim.delete(params[:id])
    # nowhere to go
    render 'personal_details', :layout => 'application-claims'
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.save
    redirect_to @claim
  end

  private

  def claim_params
    params.require(:claim).permit!
  end
end
