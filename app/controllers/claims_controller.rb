class ClaimsController < ApplicationController
  def new
   Rails.logger.debug "params: #{params}"
   @page_title = 'Step 1 - Personal details'
   render 'step1', :layout => 'application-claims'
  end
end
