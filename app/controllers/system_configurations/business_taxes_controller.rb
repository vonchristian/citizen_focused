module SystemConfigurations
  class BusinessTaxesController < ApplicationController
    def new
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @business_tax = @line_of_business.business_taxes.build
    end

    def create
      @line_of_business = LineOfBusiness.find(params[:line_of_business_id])
      @business_tax = @line_of_business.business_taxes.create(business_tax_params)
      if @business_tax.save
        redirect_to system_configurations_line_of_business_url(@line_of_business), notice: "saved successfully."
      else
        render :new
      end
    end

    private
    def business_tax_params
      params.require(:taxes_business_tax).permit(:tax_amount)
    end
  end
end
