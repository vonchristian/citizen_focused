module SystemConfigurations
  class GrossSaleTaxesController < ApplicationController
    def new
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @gross_sale_tax = @line_of_business.gross_sale_taxes.build
    end

    def create
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @gross_sale_tax = @line_of_business.gross_sale_taxes.create(gross_sale_tax_params)
      if @gross_sale_tax.save
        redirect_to system_configurations_line_of_business_url(@line_of_business), notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def gross_sale_tax_params
      params.require(:taxes_gross_sale_tax).permit(:min_gross_sale, :max_gross_sale, :tax_amount, :tax_percentage, :name)
    end
  end
end
