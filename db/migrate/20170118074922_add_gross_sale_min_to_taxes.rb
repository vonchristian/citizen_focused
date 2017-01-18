class AddGrossSaleMinToTaxes < ActiveRecord::Migration[5.0]
  def change
    add_column :taxes, :min_gross_sale, :decimal
    add_column :taxes, :max_gross_sale, :decimal
  end
end
