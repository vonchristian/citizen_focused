class CreateEnterpriseScales < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprise_scales do |t|
      t.string :name
      t.decimal :minimum
      t.decimal :maximum

      t.timestamps
    end
  end
end
