class AddCodeToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :code, :string
  end
end
