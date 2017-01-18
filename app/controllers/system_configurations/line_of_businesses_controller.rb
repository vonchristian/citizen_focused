module SystemConfigurations
  class LineOfBusinessesController < ApplicationController
    def index
      @line_of_businesses = LineOfBusiness.all
    end

    def new
      @line_of_business = LineOfBusiness.new
    end
    def create
      @line_of_business = LineOfBusiness.create(line_of_business_params)
      if @line_of_business.save
        redirect_to system_configurations_line_of_businesses_url, notice: "saved successfully"
      else
        render :new
      end
    end

    def show
      @line_of_business = LineOfBusiness.find(params[:id])
    end

    private
    def line_of_business_params
      params.require(:line_of_business).permit(:name, :line_of_business_tax_config_id)
    end
  end
end
