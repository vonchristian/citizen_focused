module SystemConfigurations
  class RetailerGrossSaleMinimumsController < ApplicationController
    def new
      @retailer_gross_sale_minimum = Configurations::RetailerGrossSaleMinimum.new
    end

    def create
      @retailer_gross_sale_minimum = Configurations::RetailerGrossSaleMinimum.create(retailer_gross_sale_minimum_params)
      if @retailer_gross_sale_minimum.save
        redirect_to system_configurations_url, notice: "saved successfully"
      else
        render :new
      end
    end

    private
    def retailer_gross_sale_minimum_params
      params.require(:configurations_retailer_gross_sale_minimum).permit(:amount)
    end
  end
end
