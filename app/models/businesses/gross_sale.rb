module Businesses
  class GrossSale < ApplicationRecord
    belongs_to :business
    validates :amount, presence: true, numericality: true
  end
end
