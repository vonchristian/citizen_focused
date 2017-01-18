FactoryGirl.define do
  factory :type_of_organization do
    sequence :name { |n| "Name #{n}" }
  end
end
