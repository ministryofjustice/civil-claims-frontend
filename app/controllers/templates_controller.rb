class TemplatesController < ApplicationController
  def templates
    render 'templates/templates', :layout => 'application-rebuild-templates'
  end
end
