module Businesses
  class BusinessFee < ApplicationRecord
    belongs_to :fee
    belongs_to :business
    validates :fee_id,  uniqueness: { scope: :business_id }
    def self.set_default_fees(business)
      Fee.default.each do |fee|
        self.create(business: business, fee: fee)
      end
    end
  end
end
