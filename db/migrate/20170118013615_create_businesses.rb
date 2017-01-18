class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.belongs_to :taxpayer, foreign_key: true
      t.decimal :asset_size
      t.boolean :renting
      t.integer :employee_count

      t.timestamps
    end
  end
end
