module Businesses
  class GrossSalesController < ApplicationController
    def new
      @business_activity = Businesses::BusinessActivity.find(params[:business_activity_id])
      @gross_sale = @business_activity.gross_sales.build
    end
    def create
      @business_activity = Businesses::BusinessActivity.find(params[:business_activity_id])
      @gross_sale = @business_activity.gross_sales.create(gross_sale_params)
      if @gross_sale.save
        redirect_to business_path(@business_activity.business), notice: "saved successfully"
      else
        render :new
      end
    end

    private
    def gross_sale_params
      params.require(:businesses_gross_sale).permit(:year, :amount)
    end
  end
end
