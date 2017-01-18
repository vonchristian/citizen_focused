FactoryGirl.define do
  factory :business_activity, class: "Businesses::BusinessActivity" do
    business nil
    line_of_business nil
  end
end
