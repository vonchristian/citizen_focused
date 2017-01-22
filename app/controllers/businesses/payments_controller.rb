module Businesses
  class PaymentsController < ApplicationController
    def new
      @business = Business.find(params[:business_id])
      @entry = Accounting::Entry.new
      @entry.credit_amounts.build
      @entry.debit_amounts.build
    end
    def create
      @business = Business.find(params[:business_id])
      @entry = Accounting::Entry.create(entry_params)
      @entry.commercial_document = @business
      if @entry.save
        redirect_to @business, notice: "payment saved successfully."
      else
        render :new
      end
    end

  

    private
    def entry_params
      params.require(:accounting_entry).permit(:entry_date, :reference_number, :description, credit_amounts_attributes:[:amount, :account_id], debit_amounts_attributes: [:amount, :account_id])
    end
  end
end
