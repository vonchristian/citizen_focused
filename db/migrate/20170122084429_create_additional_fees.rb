class CreateAdditionalFees < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_fees do |t|
      t.belongs_to :business, foreign_key: true
      t.belongs_to :fee, foreign_key: true

      t.timestamps
    end
  end
end
