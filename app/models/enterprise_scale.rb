class EnterpriseScale < ApplicationRecord
  validates :minimum, :maximum, presence: true
  validates :minimum, numericality: { less_than: :maximum }
  validates :maximum, numericality: { greater_than: :minimum }

  def self.set_enterprise_scale(business)
    enterprise_scale = all.select{|a| a.range.include?(business.asset_size)}.first
    if enterprise_scale
      business.enterprise_scale = enterprise_scale
    end
  end

  def range
    minimum..maximum
  end

end
