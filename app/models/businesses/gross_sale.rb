module Businesses
  class GrossSale < ApplicationRecord
    belongs_to :business_activity
    validates :amount, presence: true, numericality: true
    validate :minimum_amount_for_retailers
    delegate :retailer?, to: :business_activity, allow_nil: true
    after_commit :set_tax
    private
    def minimum_amount_for_retailers
      errors[:amount] << "Amount must be at least #{Configurations::RetailerGrossSaleMinimum.last.amount}" if self.retailer? && self.amount < Configurations::RetailerGrossSaleMinimum.last.amount
    end

    def set_tax
      Taxes::TaxAssessment.new(self, 0).set_tax
    end

  end
end
