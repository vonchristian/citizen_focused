module Taxes
  class Assessment
    def initialize(taxable)
      @taxable = taxable
    end
    def set_tax(taxable)
      if taxable.is_amount_based?
        Taxes::BusinessTax.set_tax(taxable)
      elsif taxable.is_percentage_based?
        Taxes::PercentageTax.set_tax(taxable.line_of_business)
      elsif taxable.is_gross_sales_based?
        Taxes::GrossSaleTax.set_tax(taxable.line_of_business)
      end
    end
  end
end
