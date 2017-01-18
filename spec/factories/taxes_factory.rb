FactoryGirl.define do
  factory :tax do
    name { Faker::Commerce.product_name }
    taxable_id 1
    taxable_type "MyString"
    tax_type 1
    tax_amount "9.99"
    tax_percentage ""
  end
  factory :business_tax, class: "Taxes::BusinessTax" do |tax|
    tax.name
  end
end
