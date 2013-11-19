class ClaimsController < ApplicationController
  def new
    Rails.logger.debug "Parameters are: #{params}"
    @page_title = 'Step 1 - Personal details'
    @property = Property.new
    render 'step1', :layout => 'application-claims'
  end

  def create
    Rails.logger.debug "Parameters are: #{params}"
    #@property = nil
    #begin
      Rails.logger.debug 'Calling backend-api'
      @property = Property.create(property_params)
    #rescue StandardError => e
    #  Rails.logger.error "Error " + e.to_s
    #end
    render 'step1', :layout => 'application-claims'
  end

  private

  def property_params
    params.require(:property).permit(:street, :town,
      :postcode, :residential, :commercial,
      :resident_type, :land_registry_title_number)
  end
end
