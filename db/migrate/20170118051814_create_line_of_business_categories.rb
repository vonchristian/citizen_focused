class CreateLineOfBusinessCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :line_of_business_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
