module Businesses
  class Capital < ApplicationRecord
    belongs_to :business

    validates :amount, presence: true, numericality: { greater_than: 0.1 }
  end
end
