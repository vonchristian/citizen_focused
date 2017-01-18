class CreateBarangays < ActiveRecord::Migration[5.0]
  def change
    create_table :barangays do |t|
      t.string :name, null: false, default: ""
      t.integer :subscriber_id

      t.timestamps
    end
    add_index :barangays, :subscriber_id
  end
end
