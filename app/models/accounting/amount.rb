module Accounting
  class Amount < ActiveRecord::Base
    belongs_to :entry, :class_name => 'Accounting::Entry'
    belongs_to :account, :class_name => 'Accounting::Account'

    validates_presence_of :type, :amount, :entry, :account

    def account_name=(name)
      self.account = Account.find_by_name!(name)
    end

    protected

    def account_with_name_lookup=(v)
      if v.kind_of?(String)
        ActiveSupport::Deprecation.warn('Accounting was given an :account String (use account_name instead)', caller)
        self.account_name = v
      else
        self.account_without_name_lookup = v
      end
    end
    alias_method_chain :account=, :name_lookup
  end
end
