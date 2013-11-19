require 'spec_helper'

if ENV['INTEGRATION']

  def fill_in_valid_property(overides={})
    within('.property-details') do
      fill_in 'Street', with: overides[:street] || "102"
      fill_in 'Town', with: overides[:town] || "Westminster"
      fill_in 'Postcode', with: overides[:post_code] || "SW1H 9AJ"
      check 'Residential'
      check 'Commercial'
      choose overides[:who_is_in_property] || 'Tenants'
      fill_in 'Title number', with: overides[:title_number] || "26736736"
    end
  end

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

         Landlord\ details
         Company\ name
         Street Town Postcode Title
         Full\ name Phone Mobile Email
         DX\ number DX\ exchange

         Tenant\ details
         If\ the\ tenant's\ current\ address
         Continue\ to\ next\ step
         Save\ and\ come\ back\ later
         ).each do |field|
        #expect(page).to have_content(field)
      end

      property = {}
      property[:street] = "102"
      property[:town] = "Westminster"
      property[:post_code] = "SW1H 9AJ"
      property[:who_is_in_property] = "Tenants"
      property[:title_number] = "26736736"

      fill_in_valid_property property

      click_button 'Continue to next step'

      within('.property-details') do
        expect(find_field('agent-town').value).to have_content('Westminster')
        expect(find_field('agent-postcode').value).to have_content('SW1H 9AJ')
        expect(find_field('title-number').value).to have_content('26736736')

        expect(find(:css, '#property-residential')).to be_checked
        expect(find(:css, '#property-commercial')).to be_checked
        expect(find(:css, '#property_resident_type_tenants')).to be_checked
        expect(find(:css, '#property_resident_type_squatters')).not_to be_checked
      end
    end
  end

end
