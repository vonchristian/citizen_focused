class CreateFees < ActiveRecord::Migration[5.0]
  def change
    create_table :fees do |t|
      t.string :type
      t.string :name, unique: true
      t.decimal :amount
      t.integer :feeable_id
      t.string :feeable_type
      t.boolean :default, default: false

      t.timestamps
    end
    add_index :fees, :type
    add_index :fees, :feeable_id
    add_index :fees, :feeable_type
  end
end
