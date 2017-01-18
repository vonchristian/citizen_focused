FactoryGirl.define do
  factory :taxpayer do
    first_name  { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name   { Faker::Name.last_name }
    full_name   { Faker::Name.name_with_middle }
    sex 'male'
    date_of_birth { 18.years.ago }
    mobile_number "09999099890"
    telephone_number "446-9089"
  end
end
