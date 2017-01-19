module Taxes
  class GrossSaleTax < Tax
    def self.set_tax(taxable)
      #find line_of_business
      #find_range_that_includes_gross_sale
      #set_tax
      taxable.tax = all.where(taxable: taxable.line_of_business).select{|a| a.range.include?(taxable.amount)}.first.try(:tax_amount)
    end
    def range
      min_gross_sale..max_gross_sale
    end
  end
end
