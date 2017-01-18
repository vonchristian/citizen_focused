FactoryGirl.define do
  factory :subscriber do
    name  { Faker::Address.city }
    province nil
  end
end
