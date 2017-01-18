class AddDescriptionToLineOfBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :line_of_businesses, :description, :text
  end
end
