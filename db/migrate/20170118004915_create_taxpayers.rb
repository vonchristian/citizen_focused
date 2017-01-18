class CreateTaxpayers < ActiveRecord::Migration[5.0]
  def change
    create_table :taxpayers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :full_name, unique: true
      t.integer :sex, default: 0
      t.date :date_of_birth
      t.string :mobile_number
      t.string :telephone_number

      t.timestamps
    end
  end
end
