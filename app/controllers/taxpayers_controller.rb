class TaxpayersController < ApplicationController
  def index
  end

  def new
    @taxpayer = Taxpayer.new
  end
  def create
    @taxpayer = Taxpayer.create(taxpayer_params)
    if @taxpayer.save
      redirect_to @taxpayer, notice: "saved successfully."
    else
      render :new
    end
  end
  def show
    @taxpayer = Taxpayer.find(params[:id])
  end 

  private
  def taxpayer_params
    params.require(:taxpayer).permit(:first_name, :middle_name, :last_name, :sex, :date_of_birth, :telephone_number, :mobile_number)
  end
end
