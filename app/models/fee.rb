class Fee < ApplicationRecord
  belongs_to :feeable, polymorphic: true
  belongs_to :account, class_name: "Accounting::Account"

  validates :name, presence: true

  def self.default
    all.where(default: true)
  end

  def self.not_default
    all.where(default: false)
  end

  def self.set_default_fees(feeable)
    Fee.default.each do |fee|
      Businesses::AdditionalFee.create(business: feeable, fee: fee)
    end
  end
end
