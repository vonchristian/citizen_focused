module SystemConfigurations
  class FeesController < ApplicationController
    def index
      @fees = Fee.all
    end
    def new
      @fee = Fee.new
    end
    def create
      @fee = Fee.create(fee_params)
      if @fee.save
        redirect_to system_configurations_fees_url, notice: "created successfully."
      else
        render :new
      end
    end

    private
    def fee_params
      params.require(:fee).permit(:name, :amount, :default)
    end
  end
end
