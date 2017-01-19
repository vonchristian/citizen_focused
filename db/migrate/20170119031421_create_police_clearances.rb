class CreatePoliceClearances < ActiveRecord::Migration[5.0]
  def change
    create_table :police_clearances do |t|
      t.string :purpose

      t.timestamps
    end
  end
end
