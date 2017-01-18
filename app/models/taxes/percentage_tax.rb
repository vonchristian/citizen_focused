module Taxes
  class PercentageTax < Tax
    #
    def tax(gross_sale)
      (gross_sale.amount * gross_sale_percentage) * tax_percentage
    end

  end
end
