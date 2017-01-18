class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.belongs_to :province, foreign_key: true

      t.timestamps
    end
  end
end
