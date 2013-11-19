# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
CivilClaimsFrontend::Application.initialize!

environment = ENV["RAILS_ENV"] || "development"
puts "The log file is located at: #{Rails.root.to_s}/log/#{environment}.log"
#Rails.logger = Logger.new(STDOUT)
Rails.logger = ActiveSupport::Logger.new("#{Rails.root.to_s}/log/#{environment}.log")
ActiveResource::Base.logger = Rails.logger
