class Business < ApplicationRecord
  has_one :capital, class_name: "Businesses::Capital"
  belongs_to :taxpayer
  belongs_to :type_of_organization
  belongs_to :enterprise_scale
  has_many :addresses, as: :addressable
  has_many :gross_sales, class_name: "Businesses::GrossSale"
  has_many :business_activities, class_name: "Businesses::BusinessActivity"
  has_many :line_of_businesses, through: :business_activities


  after_commit :set_enterprise_scale

  validates :name, presence: true
  validates :employee_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :asset_size, presence: true
  
  private
  def set_enterprise_scale
    EnterpriseScale.set_enterprise_scale(self)
  end
end
