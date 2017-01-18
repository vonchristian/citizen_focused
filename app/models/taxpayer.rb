class Taxpayer < ApplicationRecord

  has_many :businesses
  has_many :addresses, as: :addressable

  validates :first_name, :middle_name, :last_name, presence: true
  validates :full_name, uniqueness: true

  before_save :set_full_name

  private
  def set_full_name
    self.full_name ||= "#{self.first_name.try(:capitalize)} #{self.middle_name.try(:capitalize)} #{self.last_name.try(:capitalize)}"
  end
end
