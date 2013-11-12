require 'spec_helper'

feature 'Submit a Claim' do

  scenario 'Adding personal details' do
    visit '/step1'

    %w(Street Town Postcode
       Step\ 1
       Personal\ details
       Fill\ in\ the\ address\ of\ the\ property
       Property\ details
       Type\ of\ property Residential Commercial
       Who\ is\ in\ the\ property?
       Tenants
       Squatters
       Title\ number
       About\ title\ numbers

       Company\ name
       Street Town Postcode Title
       Full\ name Phone Mobile Email
       DX\ number DX\ exchange

       Tenant\ details
       If\ the\ tenant's\ current\ address
       Continue\ to\ next\ step
       Save\ and\ come\ back\ later
       ).each do |field|
      expect(page).to have_content(field)
    end

  end
end
