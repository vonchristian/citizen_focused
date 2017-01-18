class Business < ApplicationRecord
  belongs_to :taxpayer

  validates :name, presence: true
  validates :employee_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :asset_size, presence: true
end
