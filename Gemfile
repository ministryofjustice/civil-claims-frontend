source 'https://rubygems.org'
source 'https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

## FRONTEND ##

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Enable HAML (required for MOJ toolkit)
gem 'haml-rails'

# required for moj_frontend_toolkit
gem 'uglifier'

# required for uglifier to work in CI
gem 'therubyracer'


# Gov.uk styles
gem 'govuk_template', '0.3.8'
gem 'govuk_frontend_toolkit', github: 'ministryofjustice/govuk_frontend_toolkit_gem', branch: 'asset-submodule'
# MOJ styles
gem 'moj_boilerplate', github: 'ministryofjustice/moj_boilerplate', tag: 'v0.6.2'
# Civil Claims shared assets
gem 'civil_claims_assets', github: 'ministryofjustice/civil-claims-assets', tag: 'v0.2.1'


## BACKEND ##

# no DB
gem "activeresource", '4.0.0'

# set environment variables via the filesystem
gem 'dotenv-rails'

# production webserver
gem 'unicorn'

# used for Feature Flags
gem 'hashie'

# Authentication Proxy
gem 'author', :github => 'ministryofjustice/author'

# Authentication tools
gem 'rack_moj_auth', :github => 'ministryofjustice/x-moj-auth'

group :development do
  gem 'awesome_print'
 # gem 'better_errors'
 # gem 'meta_request'
 # gem 'jazz_hands'
  gem 'byebug'
end


