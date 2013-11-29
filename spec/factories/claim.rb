FactoryGirl.define do
  factory :claim do
    after(:build) do |claim|
      claim.landlords << FactoryGirl.build(:landlord)
      claim.tenants   << FactoryGirl.build(:tenant)
      claim.property  =  FactoryGirl.build(:property)
    end
  end
end