module Configurations
  class RetailerGrossSaleMinimum < ApplicationRecord
    validates :amount, presence: true, numericality: true
  end
end
