class AddEnabledToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :enabled, :boolean, default: true
  end
end
