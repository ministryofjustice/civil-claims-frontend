require File.expand_path('../boot', __FILE__)

#require 'rails/all'
# Pick the frameworks you want:
# require "active_model"
# require "active_record"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require 'active_resource'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CivilClaimsFrontend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    Dir.glob("#{Rails.root}/lib/*.rb").each { |f| require f }

    config.auth_client = Author::Client.new(ENV['API_HOST'])
    
    # initialize Feature Flags
    require "#{Rails.root}/lib/feature/flags"
    Feature::Flags.init("#{Rails.root}/config/features.yml")



     # app title appears in the header bar
    config.app_title = 'Civil Claims'
    # phase governs text indicators and highlight colours
    # presumed values: alpha, beta, live
    config.phase = 'beta'
    # product type may also govern highlight colours
    # known values: information, service
    config.product_type = 'service'
    # Feedback URL (URL for feedback link in phase banner)
    # Use 'auto_add_path' for it to add a path link to the new_feedback route
    config.feedback_url = ''
    # Google Analytics ID (Tracking ID for the service)
    config.ga_id = ''



    # Enable the asset pipeline
    config.assets.enabled = true

    # Api Configuration
    config.api_uri = "#{ENV['API_HOST']}/repossession_claims_api/v1"
    puts "API endpoint is #{config.api_uri}"
  end
end
