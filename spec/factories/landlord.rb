FactoryGirl.define do
  factory :landlord do |c|

    # person
    title     "mr"
    full_name "joe bloggs"
    phone     "+44 (0)207 12345678"
    mobile    nil
    email     "email.address@example.com"

    # address
    street    "1 Astreet"
    town      "town"
    postcode  "a1 1aa"

    organisation_name    'Company Name Ltd'
  end
end