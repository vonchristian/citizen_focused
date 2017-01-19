module Taxes
  class BusinessTax < Tax
    def self.set_tax(taxable)
      taxable.tax = all.where(taxable: taxable.line_of_business).last.try(:tax_amount)
    end
  end
end
