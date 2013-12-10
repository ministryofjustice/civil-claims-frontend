class ClaimsController < ApplicationController

  def new
    @page_title = 'Step 1 - Personal details'
    @claim = Claim.new
    @claim.property = Property.new
    @claim.landlords << Landlord.new(current_user.profile.attributes)
    pp @claim
    4.times do; @claim.tenants << Tenant.new; end
    render 'personal_details', :layout => 'application-claims'
  end

  def edit
    @claim = Claim.find(params[:id])
    (4 - @claim.tenants.size).times { |i| @claim.tenants << Tenant.new }
    return redirect_to action: 'edit', id: @claim.id, page_id: 'personal_details' unless params.has_key? :page_id
    template, @page_title = page_details params[:page_id]
    render template, :layout => 'application-claims'
  end

  def update
    @claim = Claim.find(params[:id])
    @claim.update_attributes(claim_params)
    return redirect_to action: 'edit', id: @claim.id, page_id: params[:next_page] if params.has_key? :next_page
    redirect_to @claim
  end

  def destroy
    Claim.delete(params[:id])
    redirect_to root_path
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.save
    redirect_to action: 'edit', id: @claim.id, page_id: params[:next_page]
  end

  private

  def page_details(page_id)
    case page_id
    when 'personal_details'
      title = 'Step 1 - Personal details'
      template = 'personal_details'
    when 'case_details'
      title = 'Step 2 - Case details'
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
