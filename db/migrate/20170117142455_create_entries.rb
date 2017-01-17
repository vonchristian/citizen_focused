class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :reference_number
      t.datetime :entry_date
      t.integer :commercial_document_id
      t.string :commercial_document_type
      t.integer :recorder_id
      t.string :description

      t.timestamps
    end
    add_index :entries, :commercial_document_id
    add_index :entries, :commercial_document_type
    add_index :entries, :recorder_id


  end
end
