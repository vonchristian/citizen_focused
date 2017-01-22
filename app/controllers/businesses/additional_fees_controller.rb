module Businesses
  class AdditionalFeesController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @fee = @business.additional_fees.build
    end
    def create
      @business = Business.find(params[:business_id])
      @fee = @business.additional_fees.create(business_fee_params)
      if @fee.save
        redirect_to new_business_additional_fee_path(@business), notice: "Fee added successfully."
      else
        render :new
      end
    end

    private
    def business_fee_params
      params.require(:businesses_additional_fee).permit(:fee_id)
    end
  end
end
