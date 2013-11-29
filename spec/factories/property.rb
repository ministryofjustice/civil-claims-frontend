FactoryGirl.define do
  factory :property do |c|
    residential true
    commercial  false
    resident_type   'squatter'
    land_registry_title_number  nil

    street    "1 Astreet"
    town      "town"
    postcode  "a1 1aa"
  end
end