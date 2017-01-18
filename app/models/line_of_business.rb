class LineOfBusiness < ApplicationRecord
  has_one :mayors_permit_fee, as: :feeable, class_name: "Fees::MayorsPermitFee"
  belongs_to :line_of_business_category

  validates :name, presence: true, uniqueness: true
end
