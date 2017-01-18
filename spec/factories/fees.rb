FactoryGirl.define do
  factory :fee do
    type ""
    name "MyString"
    amount "9.99"
    feeable_id 1
    feeable_type "MyString"
    default false
  end
end
