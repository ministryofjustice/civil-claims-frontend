class TemplatesController < ApplicationController
  def templates
    @page_title = 'The user design template page'
    render 'templates/templates', :layout => 'application-claims'
  end

  def step2
    @page_title = 'Step 2 - Case details'
    render 'templates/demo_step2', :layout => 'application-claims'
  end
end
