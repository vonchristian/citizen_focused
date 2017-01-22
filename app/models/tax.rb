class Tax < ApplicationRecord
  belongs_to :taxable, polymorphic: true

  def self.total_amount
    all.sum(:tax_amount)
  end

end
