class CreateLineOfBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :line_of_businesses do |t|
      t.string :name
      t.belongs_to :line_of_business_category, foreign_key: true

      t.timestamps
    end
  end
end
