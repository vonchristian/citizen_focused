class CreateOfficialReceiptPrintings < ActiveRecord::Migration[5.0]
  def change
    create_table :official_receipt_printings do |t|
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
