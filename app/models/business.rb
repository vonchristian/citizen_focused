class Business < ApplicationRecord
  belongs_to :taxpayer
  belongs_to :type_of_organization
  has_many :addresses, as: :addressable

  validates :name, presence: true
  validates :employee_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :asset_size, presence: true
end
