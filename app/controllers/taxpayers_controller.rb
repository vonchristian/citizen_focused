class TaxpayersController < ApplicationController

  before_action :set_taxpayer, only: [:show, :edit, :update] # probably want to keep using this

  # GET /taxpayers
  # GET /taxpayers.json
  def index
    @taxpayers = Taxpayer.all
  end

  # # GET /taxpayers/1
  # # GET /taxpayers/1.json
  def show

  end

  # GET /taxpayers/1/edit
  def edit

  end

  # # PATCH/PUT /taxpayers/1
  # # PATCH/PUT /taxpayers/1.json
  def update
    respond_to do |format|
      if @taxpayer.update(taxpayer_params)
        format.html { redirect_to @taxpayer, notice: 'taxpayer was successfully updated.' }
        format.json { render :show, status: :ok, location: @taxpayer }
      else
        format.html { render :edit }
        format.json { render json: @taxpayer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxpayer
      @taxpayer = Taxpayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taxpayer_params
      params.require(:taxpayer).permit(:first_name, :middle_name, :last_name)
    end

end
