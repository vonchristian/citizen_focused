module Accounting
  class Account < ActiveRecord::Base
    class_attribute :normal_credit_balance

    has_many :amounts
    has_many :credit_amounts, :extend => AmountsExtension, :class_name => 'Accounting::CreditAmount'
    has_many :debit_amounts, :extend => AmountsExtension, :class_name => 'Accounting::DebitAmount'
    has_many :entries, through: :amounts, source: :entry
    has_many :credit_entries, :through => :credit_amounts, :source => :entry, :class_name => 'Accounting::Entry'
    has_many :debit_entries, :through => :debit_amounts, :source => :entry, :class_name => 'Accounting::Entry'

    validates :type, :name, presence: true
    validates :name, uniqueness: true


    def self.balance(options={})
      if self.new.class == Accounting::Account
        raise(NoMethodError, "undefined method 'balance'")
      else
        accounts_balance = BigDecimal.new('0')
        accounts = self.all
        accounts.each do |account|
          if account.contra
            accounts_balance -= account.balance(options)
          else
            accounts_balance += account.balance(options)
          end
        end
        accounts_balance
      end
    end

    def self.trial_balance
      if self.new.class == Accounting::Account
        Accounting::Asset.balance - (Accounting::Liability.balance + Accounting::Equity.balance + Accounting::Revenue.balance - Accounting::Expense.balance)
      else
        raise(NoMethodError, "undefined method 'trial_balance'")
      end
    end
  end
end
