class Fee < ApplicationRecord
  belongs_to :feeable, polymorphic: true

  validates :name, presence: true, uniqueness: true
end
