class LineOfBusinessCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
