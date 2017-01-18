class CreateLineOfBusinessTaxConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :line_of_business_tax_configs do |t|
      t.string :name

      t.timestamps
    end
  end
end
