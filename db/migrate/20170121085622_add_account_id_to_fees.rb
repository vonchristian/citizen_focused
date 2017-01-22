class AddAccountIdToFees < ActiveRecord::Migration[5.0]
  def change
    add_reference :fees, :account, foreign_key: true
  end
end
