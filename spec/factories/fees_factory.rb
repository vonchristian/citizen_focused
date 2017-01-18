FactoryGirl.define do
  factory :fee do
    type ""
    name  { Faker::Commerce.product_name }
    amount "9.99"
    feeable_id 1
    feeable_type "MyString"
    default false
  end
  factory :mayors_permit_fee, :class => Fees::MayorsPermitFee do |fee|
    fee.name
  end
end
