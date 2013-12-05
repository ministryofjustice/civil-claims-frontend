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


WebMock.disable!

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
    Dir.glob("#{Rails.root}/app/forms/*.rb").each { |f| require f }
    config.paths.add "app/presenters", :glob => "**/*.rb"
    config.autoload_paths += Dir["#{Rails.root}/app/presenters/*"]

     # app title appears in the header bar
    config.app_title = 'Civil Claims'
    # phase governs text indicators and highlight colours
    # presumed values: alpha, beta, live
    config.phase = 'beta'
    # product type may also govern highlight colours
    # known values: information, service
    config.product_type = 'service'
    # govbranding switches on or off the crown logo, full footer and NTA font
    config.govbranding = true
    # feedback_email is the address linked in the alpha/beta bar asking for feedback
    config.feedback_email = 'test@example.com'

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.precompile += %w(
      gov-static/gov-goodbrowsers.css
      gov-static/gov-ie6.css
      gov-static/gov-ie7.css
      gov-static/gov-ie8.css
      gov-static/gov-fonts.css
      gov-static/gov-fonts-ie8.css
      gov-static/gov-print.css
      moj-base.css
      claims-global.css
      claims-layout.css
      claims-components.css
      claims-mixins
      claims-global
      claims-layout
      claims-components
      components/claims-forms
      components/claims-intro
      components/claims-usernav
      components/claims-progressnav
      
      gov-static/gov-ie.js
    )

    # Api Configuration
    config.api_uri = "#{ENV['API_HOST']}/repossession_claims_api/v1"
    puts "API endpoint is #{config.api_uri}"
  end
end
