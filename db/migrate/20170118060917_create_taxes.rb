class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
      t.string :name, unique: true
      t.integer :taxable_id
      t.string :taxable_type
      t.integer :tax_type
      t.decimal :tax_amount
      t.decimal :tax_percentage
      t.boolean :default, default: false

      t.timestamps
    end
    add_index :taxes, :taxable_id
    add_index :taxes, :taxable_type
  end
end
