class AddBusinessActivityToGrossSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :gross_sales, :business_activity, foreign_key: true
  end
end
