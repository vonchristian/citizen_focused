class CreateCapitals < ActiveRecord::Migration[5.0]
  def change
    create_table :capitals do |t|
      t.belongs_to :business, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
