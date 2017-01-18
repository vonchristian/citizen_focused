class CreateRetailerGrossSaleMinimums < ActiveRecord::Migration[5.0]
  def change
    create_table :retailer_gross_sale_minimums do |t|
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
