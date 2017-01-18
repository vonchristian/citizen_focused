module Businesses
  class BusinessActivity < ApplicationRecord
    belongs_to :business
    belongs_to :line_of_business
  end
end
