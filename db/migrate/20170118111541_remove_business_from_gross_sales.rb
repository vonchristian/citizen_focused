class RemoveBusinessFromGrossSales < ActiveRecord::Migration[5.0]
  def change
    remove_index :gross_sales, :business_id
    remove_column :gross_sales, :business_id, :integer
  end
end
