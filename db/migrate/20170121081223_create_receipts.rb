class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :receipts do |t|
      t.integer :receiptable_id, index: true
      t.string :receiptable_type, index: true
      t.string :type
      t.string :number
      t.datetime :date

      t.timestamps
    end
    add_index :receipts, :type
  end
end
