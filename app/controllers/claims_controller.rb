class ClaimsController < ApplicationController
  def new
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.new
    render 'step1', :layout => 'application-claims'
  end

  def show_step1
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.find(params[:id])
    pp @claim
    headers['Last-Modified'] = Time.now.httpdate
    render 'step1', :layout => 'application-claims'
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.save
    redirect_to "/claim/#{@claim.id}"
  end

  private

  def claim_params
    params.require(:claim).permit!
  end
end
