module Accounting
  class AccountsController < ApplicationController
    def index
      @accounts = Accounting::Account.joins([:amounts, :entries])
    end
    def new
      @account = Accounting::Account.new
    end
    def create
      @account = Accounting::Account.create(account_params)
      if @account.save
        redirect_to accounting_accounts_url, notice: "created successfully."
      else
        render :new
      end
    end

    def enable
      @account = Accounting::Account.find(params[:id])
      @account.enable!
      redirect_to accounting_accounts_url, notice: 'enabled successfully.'
    end

    def disable
      @account = Accounting::Account.find(params[:id])
      @account.disable!
      redirect_to accounting_accounts_url, notice: 'disabled successfully.'
    end

    private
    def account_params
      params.require(:accounting_account).permit(:name, :code, :type, :contra)
    end
  end
end
