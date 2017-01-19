class LineOfBusiness < ApplicationRecord
  has_one :mayors_permit_fee, as: :feeable, class_name: "Fees::MayorsPermitFee"
  belongs_to :line_of_business_category
  belongs_to :line_of_business_tax_config
  has_many :gross_sale_taxes, as: :taxable, class_name: "Taxes::GrossSaleTax"
  has_many :percentage_taxes, as: :taxable, class_name: "Taxes::PercentageTax"
  has_many :business_taxes,   as: :taxable, class_name: "Taxes::BusinessTax"

  validates :name, presence: true, uniqueness: true
  validates :line_of_business_tax_config_id, presence: true

  accepts_nested_attributes_for :mayors_permit_fee

  delegate :is_amount_based?, :is_percentage_based?, :is_gross_sales_based?, to: :line_of_business_tax_config, allow_nil: true
end
