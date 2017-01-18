module Taxpayers
  class BusinessesController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = @taxpayer.businesses.build
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @business = @taxpayer.businesses.create(business_params)
      if @business.save
        redirect_to @business, notice: 'saved successfully'
      else
        render :new
      end
    end

    private
    def business_params
      params.require(:business).permit(:name, :employee_count, :asset_size)
    end
  end
end
