class Tax < ApplicationRecord
  belongs_to :taxable, polymorphic: true

  validates :name, presence: true, uniqueness: true
end
