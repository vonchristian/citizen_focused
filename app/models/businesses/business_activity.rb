module Businesses
  class BusinessActivity < ApplicationRecord
    belongs_to :business
    belongs_to :line_of_business
    has_many :gross_sales, class_name: "Businesses::GrossSale"
    has_many :taxes, through: :line_of_business, as: :taxable

    delegate :name, to: :line_of_business, prefix: true, allow_nil: true
    delegate :retailer?, to: :line_of_business, allow_nil: true
  end
end
