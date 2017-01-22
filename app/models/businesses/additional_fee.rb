module Businesses
  class AdditionalFee < ApplicationRecord
    belongs_to :business
    belongs_to :fee
  end
end
