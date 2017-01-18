class LineOfBusiness < ApplicationRecord
  belongs_to :line_of_business_category

  validates :name, presence: true, uniqueness: true
end
