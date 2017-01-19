class PoliceClearanceIssuance < ApplicationRecord
  belongs_to :taxpayer
  belongs_to :police_clearance
end
