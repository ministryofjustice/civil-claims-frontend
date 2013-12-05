class ClaimsController < ApplicationController

  def new
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.new
    render 'personal_details', :layout => 'application-claims'
  end

  def show
    @claim = Claim.find(params[:id])
    return redirect_to action: 'show', id: @claim.id, page_id: 'personal_details' unless params.has_key? :page_id
    template, @page_title = claim_wizard_steps params[:page_id]
    render template, :layout => 'application-claims'
  end

  def update
    @claim = Claim.find(params[:id])
    @claim.update_attributes(claim_params)

    redirect_to @claim
  end

  def destroy
    Claim.delete(params[:id])
    redirect_to root_path
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.save
    redirect_to @claim
  end

  private

  def claim_wizard_steps(page_id)
    case page_id
    when 'personal_details'
      title = 'Step 1 - Personal details'
      template = 'personal_details'
    when 'case_details'
      title = 'Step 2 - Case Details'
      template = 'case_details'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
    return template, title
  end

  def claim_params
    params.require(:claim).permit!
  end
end
