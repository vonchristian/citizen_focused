module Businesses
  class GrossSale < ApplicationRecord
    belongs_to :business_activity
    validates :amount, presence: true, numericality: true
    validate :minimum_amount_for_retailers
    delegate :retailer?, to: :business_activity, allow_nil: true
    after_commit :set_tax
    delegate :line_of_business, to: :business_activity
    delegate :is_amount_based?, :is_percentage_based?, :is_gross_sales_based?, to: :line_of_business
    private
    def minimum_amount_for_retailers
      errors[:amount] << "Amount must be at least #{Configurations::RetailerGrossSaleMinimum.last.amount}" if self.retailer? && self.amount < Configurations::RetailerGrossSaleMinimum.last.amount
    end

    def set_tax
      if self.is_amount_based?
        Taxes::BusinessTax.set_tax(self)
      elsif self.is_percentage_based?
        Taxes::PercentageTax.set_tax(self.line_of_business)
      elsif self..is_gross_sales_based?
        Taxes::GrossSaleTax.set_tax(self.line_of_business)
      end
    end

  end
end
