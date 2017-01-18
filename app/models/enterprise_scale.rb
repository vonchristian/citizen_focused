class EnterpriseScale < ApplicationRecord
  validates :minimum, :maximum, presence: true
  validates :minimum, numericality: { less_than: :maximum }
  validates :maximum, numericality: { greater_than: :minimum }

  def range
    minimum..maximum
  end
end
