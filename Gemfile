source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem "activeresource", '4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# set environment variables via the filesystem
gem 'dotenv-rails'

# production webserver
gem 'unicorn'

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
  gem 'factory_girl_rails'
end

group :test do
  gem 'coveralls', require: false
  gem 'rspec-rails', '~> 2.0'
  gem 'capybara'
  gem 'webmock', "1.12"
  gem 'vcr'
  gem 'shoulda-matchers'
end


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Enable HAML (required for MOJ toolkit)
gem 'haml-rails'

# Gov.uk styles
gem 'govuk_frontend_toolkit'

# MOJ styles
gem 'moj_frontend_toolkit_gem', git: 'https://github.com/ministryofjustice/moj_frontend_toolkit_gem.git', tag: 'v0.0.40'

