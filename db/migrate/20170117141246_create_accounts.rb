class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, unique:true
      t.string :type
      t.boolean :contra, default: false

      t.timestamps
    end
    add_index :accounts, :type
  end
end
