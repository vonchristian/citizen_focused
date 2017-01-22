class Fee < ApplicationRecord
  belongs_to :feeable, polymorphic: true
  belongs_to :account, class_name: "Accounting::Account"

  validates :name, presence: true

  def self.default
    all.where(default: true)
  end
end
