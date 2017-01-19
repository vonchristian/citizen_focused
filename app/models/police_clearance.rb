class PoliceClearance < ApplicationRecord
  has_one :police_clearance_fee, as: :feeable, class_name: "Fees::PoliceClearanceFee"

  accepts_nested_attributes_for :police_clearance_fee
end
