require 'spec_helper'

feature 'Submit a Claim' do

  scenario 'Adding personal details' do
    visit '/step1'

    fill_in_valid_property

    fill_in_valid_landlord

    within('#tenant-1') do
     fill_in_valid_tenant
    end

    VCR.use_cassette('claim-for-westminster') do
      click_button 'Continue to next step'
    end

    within('.property-details') do
      expect(find_field('agent-town').value).to have_content('Westminster')
      expect(find_field('agent-postcode').value).to have_content('SW1H 9AJ')
      expect(find_field('title-number').value).to have_content('26736736')

      expect(find(:css, '#property-residential')).to be_checked
      expect(find(:css, '#property-commercial')).to be_checked
      expect(find(:css, '#claim_property_resident_type_tenants')).to be_checked
      expect(find(:css, '#claim_property_resident_type_squatters')).not_to be_checked
    end

    within('.landlord-details') do
      expect(find_field('landlord-companyname').value).to have_content('Bristol County Council')
      expect(find_field('landlord-address').value).to have_content('18 My Street')
      expect(find_field('landlord-town').value).to have_content('Bristol')
      expect(find_field('landlord-postcode').value).to have_content('N3 3LLC')
      expect(find_field('landlord-title').value).to have_content('Mr.')
      expect(find_field('landlord-name').value).to have_content('Thomas Brown')
      expect(find_field('landlord-phone').value).to have_content('01 23727 3 262')
      expect(find_field('landlord-mobile').value).to have_content('07 523 262 262')
      expect(find_field('landlord-email').value).to have_content('housing@bristol.gov.uk')
      expect(find_field('landlord-dxnumber').value).to have_content('3636')
      expect(find_field('landlord-dxexchange').value).to have_content('Ex 3737')
    end

    within('#tenant-1') do
      expect(find_field('tenant-title').value).to have_content('Miss')
      expect(find_field('tenant-name').value).to have_content('Catty Ashh')
      expect(find_field('tenant-phone').value).to have_content('01 111 111 111')
      expect(find_field('tenant-mobile').value).to have_content('07 111 111 111')
      expect(find_field('tenant-email').value).to have_content('cash@guilford.gov.uk')
      expect(find_field('tenant-address').value).to have_content('183 Guilford Street')
      expect(find_field('tenant-town').value).to have_content('Guilford')
      expect(find_field('tenant-postcode').value).to have_content('BS BS')
    end
  end
end

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

def fill_in_valid_landlord(overides={})
  within('.landlord-details') do
    fill_in 'Company name', with: overides[:company] || "Bristol County Council"
    fill_in 'Street', with: overides[:street] || "18 My Street"
    fill_in 'Town', with: overides[:town ] || "Bristol"
    fill_in 'Postcode', with: overides[:post_code] || "N3 3LLC"
    fill_in 'Title', with: overides[:title] || "Mr."
    fill_in 'Full name', with: overides[:full_name] || "Thomas Brown"
    fill_in 'Phone', with: overides[:phone] || "01 23727 3 262"
    fill_in 'Mobile', with: overides[:mobile] || "07 523 262 262"
    fill_in 'Email', with: overides[:email] || "housing@bristol.gov.uk"
    fill_in 'DX number', with: overides[:dx_number] || "3636"
    fill_in 'DX exchange', with: overides[:dx_exchange] || "Ex 3737"
  end
end

def fill_in_valid_tenant(overides={})
  fill_in 'Title', with: overides[:title] || "Miss"
  fill_in 'Full name', with: overides[:full_name] || "Catty Ashh"
  fill_in 'Phone', with: overides[:phone] || "01 111 111 111"
  fill_in 'Mobile', with: overides[:mobile] || "07 111 111 111"
  fill_in 'Email', with: overides[:email] || "cash@guilford.gov.uk"
  fill_in 'Street', with: overides[:street] || "183 Guilford Street"
  fill_in 'Town', with: overides[:town ] || "Guilford"
  fill_in 'Postcode', with: overides[:post_code] || "BS BS"
end
