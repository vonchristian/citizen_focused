class CreatePoliceClearanceIssuances < ActiveRecord::Migration[5.0]
  def change
    create_table :police_clearance_issuances do |t|
      t.belongs_to :taxpayer, foreign_key: true
      t.belongs_to :police_clearance, foreign_key: true

      t.timestamps
    end
  end
end
