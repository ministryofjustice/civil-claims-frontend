class Presenter
  extend Forwardable
  include ActiveModel
  
  def initialize(params={})
    params.each_pair do |attribute, value| 
      self.send :"#{attribute}=", value
    end unless params.nil?
  end
end