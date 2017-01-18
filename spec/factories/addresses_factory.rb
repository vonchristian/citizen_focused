FactoryGirl.define do
  factory :address do
    addressable_id 1
    addressable_type "MyString"
    house_or_building_number "MyString"
    building_name "MyString"
    unit_number "MyString"
    subdivision "MyString"
  end
end
