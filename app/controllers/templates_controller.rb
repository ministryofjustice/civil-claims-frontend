class TemplatesController < ApplicationController
  def templates
    render 'templates/templates', :layout => 'application-claims'
  end
end
