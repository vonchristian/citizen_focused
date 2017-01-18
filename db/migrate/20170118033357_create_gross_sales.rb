class CreateGrossSales < ActiveRecord::Migration[5.0]
  def change
    create_table :gross_sales do |t|
      t.date :year
      t.decimal :amount
      t.decimal :tax
      t.belongs_to :business

      t.timestamps
    end
  end
end
