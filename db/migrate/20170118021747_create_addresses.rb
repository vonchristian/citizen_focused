class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :house_or_building_number
      t.string :building_name
      t.string :unit_number
      t.string :subdivision

      t.timestamps
    end
    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
  end
end
