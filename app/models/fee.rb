class Fee < ApplicationRecord
  belongs_to :feeable, polymorphic: true

  validates :name, presence: true

  def self.default
    all.where(default: true)
  end
end
