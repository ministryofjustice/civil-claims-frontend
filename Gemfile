source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem "activeresource", '4.0.0'
gem 'wicked'

# Use sqlite3 as the database for Active Record
# gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'spork', '1.0.0rc3'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem 'guard-spork'
end

group :development, :test do
  gem 'coveralls', require: false
  gem 'rspec-rails', '~> 2.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'hirb'
  gem 'wirble'
  gem 'wirb'
  gem 'jazz_hands'
  gem 'capybara'
  gem 'launchy'
  gem 'dotenv-rails'
  #gem 'rubyzip2'
  #gem 'selenium-webdriver', "~> 2.37.0"
  gem 'foreman'
  gem 'webmock', "1.12"
  gem 'vcr'
  gem 'cucumber-rails', :require => false
end

# Enable HAML (required for MOJ toolkit)
gem 'haml-rails'

# Gov.uk styles
gem 'govuk_frontend_toolkit'

# MOJ styles
gem 'moj_frontend_toolkit_gem', git: 'https://github.com/ministryofjustice/moj_frontend_toolkit_gem.git', tag: 'v0.0.40'

# Heroku dependencies
gem 'rails_12factor'
