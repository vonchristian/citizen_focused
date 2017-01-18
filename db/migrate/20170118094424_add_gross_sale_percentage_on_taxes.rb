class AddGrossSalePercentageOnTaxes < ActiveRecord::Migration[5.0]
  def change
    add_column :taxes, :gross_sale_percentage, :decimal
  end
end
