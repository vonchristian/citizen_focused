FactoryGirl.define do
  factory :capital, class: "Businesses::Capital" do
    business nil
    amount 100
  end
end
