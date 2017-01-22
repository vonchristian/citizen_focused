class Business < ApplicationRecord
  has_one :capital, class_name: "Businesses::Capital"
  belongs_to :taxpayer
  belongs_to :type_of_organization
  belongs_to :enterprise_scale
  has_many :addresses, as: :addressable
  has_many :gross_sales, class_name: "Businesses::GrossSale"
  has_many :business_activities, class_name: "Businesses::BusinessActivity"
  has_many :line_of_businesses, through: :business_activities

  has_many :business_fees, class_name: "Businesses::BusinessFee"
  has_many :fees, through: :business_fees


  after_commit :set_enterprise_scale, :set_default_fees

  validates :name, presence: true
  validates :employee_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :asset_size, presence: true
  def assessed?
    entry = Accounting::Asset.find_by_name("Receivables from Taxpayers").debit_entries.where(commercial_document: self).last
    entry.present? && entry.entry_date.between?(Time.zone.now.beginning_of_year, Time.zone.now.end_of_year)
  end

  private
  def set_enterprise_scale
    EnterpriseScale.set_enterprise_scale(self)
  end
  def set_default_fees
    Businesses::BusinessFee.set_default_fees(self)
  end
end
