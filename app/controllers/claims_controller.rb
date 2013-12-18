class ClaimsController < ApplicationController

  def new
    @page_title = 'Step 1 - Personal details'
    build_claim
    render 'personal_details', :layout => 'application-claims'
  end

  def edit
    if params.has_key? :page_id
      build_claim(params[:id])
      template, @page_title = page_details params[:page_id]
      render template, :layout => 'application-claims'
    else
      claim = Claim.find(params[:id])
      redirect_to action: 'edit', id: claim.id, page_id: 'personal_details'
    end
  end

  def update
    ap params
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

  def build_claim(id='')
    if(id.blank?)
      @claim = Claim.new
    else
      @claim = Claim.find(id)
    end

    @claim.property ||= Property.new
    (4 - @claim.tenants.size).times { |i| @claim.tenants << Tenant.new }

    @claim.case_detail ||= CaseDetail.new

    @claim.landlords << Landlord.new(current_user.profile.attributes)
  end

  def page_details(page_id)
    case page_id
    when 'personal_details'
      title = 'Step 1 - Personal details'
      template = 'personal_details'
    when 'case_details'
      title = 'Step 2 - Case details'
      template = 'case_details'
    when 'check_details'
      title = 'Step 3 - Check details'
      template = 'check_details'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
    return template, title
  end

  def claim_params
    params.require(:claim).permit!
  end
end
