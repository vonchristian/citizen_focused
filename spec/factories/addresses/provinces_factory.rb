FactoryGirl.define do
  factory :province, class: "Addresses::Province" do
    name  { Faker::Address.state }
  end
end
