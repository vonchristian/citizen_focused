module SystemConfigurations
  class PercentageTaxesController < ApplicationController
    def new
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @percentage_tax = @line_of_business.percentage_taxes.build
    end

    def create
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @percentage_tax = @line_of_business.percentage_taxes.create(percentage_tax_params)
      if @percentage_tax.save
        redirect_to system_configurations_line_of_business_url(@line_of_business), notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def percentage_tax_params
      params.require(:taxes_percentage_tax).permit(:gross_sale_percentage, :tax_percentage)
    end
  end
end
