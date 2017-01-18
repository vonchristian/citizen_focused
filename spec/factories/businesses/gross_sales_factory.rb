FactoryGirl.define do
  factory :gross_sale, class: "Businesses::GrossSale" do
    year "2017-01-18"
    amount 10_000
    tax 99
  end
end
