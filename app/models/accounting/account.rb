module Accounting
  # The Account class represents accounts in the system. Each account must be subclassed as one of the following types:
  #
  #   TYPE        | NORMAL BALANCE    | DESCRIPTION
  #   --------------------------------------------------------------------------
  #   Asset       | Debit             | Resources owned by the Business Entity
  #   Liability   | Credit            | Debts owed to outsiders
  #   Equity      | Credit            | Owners rights to the Assets
  #   Revenue     | Credit            | Increases in owners equity
  #   Expense     | Debit             | Assets or services consumed in the generation of revenue
  #
  # Each account can also be marked as a "Contra Account". A contra account will have it's
  # normal balance swapped. For example, to remove equity, a "Drawing" account may be created
  # as a contra equity account as follows:
  #
  #   Accounting::Equity.create(:name => "Drawing", contra => true)
  #
  # At all times the balance of all accounts should conform to the "accounting equation"
  #   Accounting::Assets = Liabilties + Owner's Equity
  #
  # Each sublclass account acts as it's own ledger. See the individual subclasses for a
  # description.
  #
  # @abstract
  #   An account must be a subclass to be saved to the database. The Account class
  #   has a singleton method {trial_balance} to calculate the balance on all Accounts.
  #
  # @see http://en.wikipedia.org/wiki/Accounting_equation Accounting Equation
  # @see http://en.wikipedia.org/wiki/Debits_and_credits Debits, Credits, and Contra Accounts
  #
  # @author Michael Bulat
  class Account < ActiveRecord::Base
    class_attribute :normal_credit_balance

    has_many :amounts, class_name: "Accounting::Amount"
    has_many :credit_amounts, :extend => AmountsExtension, :class_name => 'Accounting::CreditAmount'
    has_many :debit_amounts, :extend => AmountsExtension, :class_name => 'Accounting::DebitAmount'
    has_many :entries, through: :amounts, source: :entry
    has_many :credit_entries, :through => :credit_amounts, :source => :entry, :class_name => 'Accounting::Entry'
    has_many :debit_entries, :through => :debit_amounts, :source => :entry, :class_name => 'Accounting::Entry'

    validates_presence_of :type
    validates :name, presence: true, uniqueness: true

    def self.types
      ["Accounting::Asset",
       "Accounting::Equity",
       "Accounting::Liability",
       "Accounting::Expense",
       "Accounting::Revenue"]
    end

    def self.disabled
      all.where(enabled: false)
    end
    # The balance of the account. This instance method is intended for use only
    # on instances of account subclasses.
    #
    # If the account has a normal credit balance, the debits are subtracted from the credits
    # unless this is a contra account, in which case credits are substracted from debits.
    #
    # For a normal debit balance, the credits are subtracted from the debits
    # unless this is a contra account, in which case debits are subtracted from credits.
    #
    # Takes an optional hash specifying :from_date and :to_date for calculating balances during periods.
    # :from_date and :to_date may be strings of the form "yyyy-mm-dd" or Ruby Date objects
    #
    # @example
    #   >> liability.balance({:from_date => "2000-01-01", :to_date => Date.today})
    #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
    #
    # @example
    #   >> liability.balance
    #   => #<BigDecimal:103259bb8,'0.2E4',4(12)>
    #
    # @return [BigDecimal] The decimal value balance
    def balance(options={})
      if self.class == Accounting::Account
        raise(NoMethodError, "undefined method 'balance'")
      else
        if self.normal_credit_balance ^ contra
          credits_balance(options) - debits_balance(options)
        else
          debits_balance(options) - credits_balance(options)
        end
      end
    end

    # The credit balance for the account.
    #
    # Takes an optional hash specifying :from_date and :to_date for calculating balances during periods.
    # :from_date and :to_date may be strings of the form "yyyy-mm-dd" or Ruby Date objects
    #
    # @example
    #   >> asset.credits_balance({:from_date => "2000-01-01", :to_date => Date.today})
    #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
    #
    # @example
    #   >> asset.credits_balance
    #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
    #
    # @return [BigDecimal] The decimal value credit balance
    def credits_balance(options={})
      credit_amounts.balance(options)
    end

    # The debit balance for the account.
    #
    # Takes an optional hash specifying :from_date and :to_date for calculating balances during periods.
    # :from_date and :to_date may be strings of the form "yyyy-mm-dd" or Ruby Date objects
    #
    # @example
    #   >> asset.debits_balance({:from_date => "2000-01-01", :to_date => Date.today})
    #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
    #
    # @example
    #   >> asset.debits_balance
    #   => #<BigDecimal:103259bb8,'0.3E4',4(12)>
    #
    # @return [BigDecimal] The decimal value credit balance
    def debits_balance(options={})
      debit_amounts.balance(options)
    end

    # This class method is used to return the balance of all accounts
    # for a given class and is intended for use only on account subclasses.
    #
    # Contra accounts are automatically subtracted from the balance.
    #
    # Takes an optional hash specifying :from_date and :to_date for calculating balances during periods.
    # :from_date and :to_date may be strings of the form "yyyy-mm-dd" or Ruby Date objects
    #
    # @example
    #   >> Accounting::Liability.balance({:from_date => "2000-01-01", :to_date => Date.today})
    #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
    #
    # @example
    #   >> Accounting::Liability.balance
    #   => #<BigDecimal:1030fcc98,'0.82875E5',8(20)>
    #

    # @return [BigDecimal] The decimal value balance
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

    # The trial balance of all accounts in the system. This should always equal zero,
    # otherwise there is an error in the system.
    #
    # @example
    #   >> Account.trial_balance.to_i
    #   => 0
    #
    # @return [BigDecimal] The decimal value balance of all accounts
    def self.trial_balance
      if self.new.class == Accounting::Account
        Accounting::Asset.balance - (Accounting::Liability.balance + Accounting::Equity.balance + Accounting::Revenue.balance - Accounting::Expense.balance)
      else
        raise(NoMethodError, "undefined method 'trial_balance'")
      end
    end
    def disabled?
      !enabled?
    end
    def disable!
      self.enabled = false
      self.save
    end

    def enable!
      self.enabled = true
      self.save
    end
  end
end
