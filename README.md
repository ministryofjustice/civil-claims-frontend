# Civil Claims Frontend Claimant

[![Build Status](https://travis-ci.org/ministryofjustice/civil-claims-frontend-claimant.png?branch=master)](https://travis-ci.org/ministryofjustice/civil-claims-frontend-claimant)
[![Code Climate](https://codeclimate.com/github/ministryofjustice/civil-claims-frontend-claimant.png)](https://codeclimate.com/github/ministryofjustice/civil-claims-frontend-claimant)
[![Coverage Status](https://coveralls.io/repos/ministryofjustice/civil-claims-frontend-claimant/badge.png?branch=master)](https://coveralls.io/r/ministryofjustice/civil-claims-frontend-claimant?branch=master)


Local installation
------------------

### Clone repo and install gems

    git clone https://github.com/ministryofjustice/civil-claims-frontend-claimant.git

    cd civil-claims-backend-data-api
    bundle install

### Run tests

To create test user:

    cd ../devise_authentication_api
    bundle exec rackup -p 9393

    cd ../civil-claims-backend-data-api
    bundle exec rails s -p 3111

    rake seed_user # creates test user in db

Run specs

    rspec spec

