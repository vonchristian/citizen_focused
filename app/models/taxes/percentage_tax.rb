module Taxes
  class PercentageTax < Tax
    def self.set_tax(taxable)
      taxable.tax = (taxable.amount * gross_sale_percentage(taxable)) * tax_percentage(taxable)
    end
    def self.gross_sale_percentage(taxable)
      all.where(taxable: taxable.line_of_business).first.try(:gross_sale_percentage)
    end
    def self.tax_percentage(taxable)
      all.where(taxable: taxable.line_of_business).first.try(:tax_percentage)
    end
  end
end
