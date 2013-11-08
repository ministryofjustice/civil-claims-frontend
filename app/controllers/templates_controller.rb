class TemplatesController < ApplicationController
  def templates
    @page_title = 'The user design template page'
    render 'templates/templates', :layout => 'application-claims'
  end

  def step1
    @page_title = 'Step 1 - Personal Details'
    render 'templates/demo_step1', :layout => 'application-claims'
  end
end
