class LineOfBusinessTaxConfig < ApplicationRecord
  def is_amount_based?
    self.name == "Amount"
  end

  def is_percentage_based?
    self.name == "Percentage" || self.name == "percentage"
  end

  def is_gross_sales_based?
    self.name == "Based on Gross Sales"
  end
end
