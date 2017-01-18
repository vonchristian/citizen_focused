module Businesses
  class BusinessActivitiesController < ApplicationController
    def new
      @line_of_businesses = LineOfBusiness.all
      @business = Business.find(params[:business_id])
      @business_activity = @business.business_activities.build
    end

    def create
      @line_of_businesses = LineOfBusiness.all
      @business = Business.find(params[:business_id])
      @business_activity = @business.business_activities.create(business_activity_params)
      if @business_activity.save
        redirect_to new_business_business_activity_path(@business), notice: "Business Activity added successfully."
      else
        render :new
      end
    end

    private
    def business_activity_params
      params.require(:businesses_business_activity).permit(:line_of_business_id)
    end
  end
end
