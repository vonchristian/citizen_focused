FactoryGirl.define do
  factory :barangay, class: "Addresses::Barangay" do
    name  { Faker::Address.street_name }
    subscriber_id nil
  end
end
