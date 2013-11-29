FactoryGirl.define do
  factory :tenant do |c|
    title     "mr"
    full_name "joe bloggs"
    phone     "+44 (0)207 12345678"
    mobile    nil
    email     "email.address@example.com"

    unknown_address false

    street    "1 Astreet"
    town      "town"
    postcode  "a1 1aa"
  end
end