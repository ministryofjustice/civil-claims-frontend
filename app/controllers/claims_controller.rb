class ClaimsController < ApplicationController
  def new
   Rails.logger.debug "params: #{params}"
   @page_title = 'Step 1 - Personal details'

   @property = Property.new

   render 'step1', :layout => 'application-claims'
  end

  def create
    Rails.logger.debug "params: #{params}"
    @property = Property.new(property_params)
    render 'step1', :layout => 'application-claims'
  end

  private

  def property_params
    params.require(:property).permit(:street, :town,
      :postcode, :residential, :commercial,
      :resident_type, :land_registry_title_number)
  end
end
