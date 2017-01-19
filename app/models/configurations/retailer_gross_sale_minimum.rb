module Configurations
  class RetailerGrossSaleMinimum < ApplicationRecord
    validates :amount, presence: true, numericality: true

    def self.default_amount
      all.last.try(:amount) || 0
    end
  end
end
