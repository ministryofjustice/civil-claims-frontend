source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem "activeresource", '4.0.0'

# Use sqlite3 as the database for Active Record
# gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'


group :development do
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'awesome_print'
 # gem 'better_errors'
 # gem 'meta_request'
 # gem 'jazz_hands'
  gem 'byebug'
end

group :development, :test do
  gem 'spork', '1.0.0rc3'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  
  gem 'coveralls', require: false
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'webmock', "1.12"
  gem 'vcr'
  gem 'shoulda-matchers'
end

# Enable HAML (required for MOJ toolkit)
gem 'haml-rails'

# Gov.uk styles
gem 'govuk_frontend_toolkit'

# MOJ styles
gem 'moj_frontend_toolkit_gem', git: 'https://github.com/ministryofjustice/moj_frontend_toolkit_gem.git', tag: 'v0.0.40'

