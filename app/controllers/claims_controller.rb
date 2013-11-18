class ClaimsController < ApplicationController
  def new
   Rails.logger.debug "params: #{params}"
   @page_title = 'Step 1 - Personal details'

   @property = Property.new
   @property.street = "102"
   @property.town = 'Westminster'
   #@property.county = 'Great London'
   @property.postcode = 'SW1H 9AJ'
   @property.residential = true
   @property.commercial = true
   @property.resident_type =  'Tenants' #'Tenants' #'Squatters'
   @property.land_registry_title_number = '26736736'

   render 'step1', :layout => 'application-claims'
  end
end
