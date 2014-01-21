class ClaimsController < ApplicationController

  before_action :redirect_to_login_page_if_not_signed_in
  before_action :load_user_profile

  def landing
    @page_title = 'Property repossession'
    render 'landing', :layout => 'application-claims'
  end

  def new
    @page_title = 'Step 1 - Personal details'
    build_claim
    render 'personal_details', :layout => 'application-claims'
  end

  def edit
    # demo of validation failure. Remove once validations are implemented.
    flash_alert 'Property must be a valid address'
    flash_alert 'First tenant full name must be entered'

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
    @claim = Claim.find(params[:id])
    @claim.update_attributes(claim_params)
    return redirect_to action: 'edit', id: @claim.id, page_id: params[:next_page] if params.has_key? :next_page
    redirect_to @claim
  end

  def pay_and_send_to_court
    @claim = Claim.find(params[:id])
    begin
      @claim.post(:send_to_court)
      redirect_to action: 'edit', id: @claim.id, page_id: 'confirmation'
    rescue
      flash_alert 'Action failed, please try again later.'
      redirect_to action: 'edit', id: @claim.id, page_id: 'pay_court_fee'
    end
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

  def load_user_profile
    if request.get?
      begin
        @user_profile = session[:profile] ||= User.profile
      rescue ActiveResource::ForbiddenAccess
        flash_alert 'Authentication error when connecting to backend.'
      rescue ActiveResource::ServerError => e
        flash_alert "Backend returned 500. #{e.message}"
      rescue Exception => e
        flash_alert e.message
      end
    end
  end

  def build_claim(id='')
    if(id.blank?)
      @claim = Claim.new
    else
      @claim = Claim.find(id)
    end

    @claim.property ||= Property.new
    (4 - @claim.tenants.size).times { |i| @claim.tenants << Tenant.new }

    @claim.case_detail ||= CaseDetail.new
    @claim.case_detail.tenancy_type ||= 'secure tenancy'
    @claim.case_detail.payment_frequency ||= 'weekly'

    @claim.landlords << Landlord.new(current_user)
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
    when 'pay_court_fee'
      title = 'Step 4 - Pay court fee'
      template = 'pay_court_fee'
    when 'confirmation'
      title = 'Step 5 - Confirmation'
      template = 'confirmation'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
    return template, title
  end

  def claim_params
    params.require(:claim).permit!
  end
end
