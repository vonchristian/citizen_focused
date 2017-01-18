class LineOfBusiness < ApplicationRecord
  has_one :mayors_permit_fee, as: :feeable, class_name: "Fees::MayorsPermitFee"
  has_one :business_tax, as: :taxable, class_name: "Taxes::BusinessTax"
  belongs_to :line_of_business_category
  has_many :gross_sale_taxes, class_name: "Taxes::GrossSaleTax", foreign_key: 'taxable_id'

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :mayors_permit_fee, :business_tax
end
