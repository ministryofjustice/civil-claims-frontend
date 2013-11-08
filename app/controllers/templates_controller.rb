class TemplatesController < ApplicationController
  def templates
    @page_title = 'The user design template page'
    render 'templates/templates', :layout => 'application-claims'
  end
end
