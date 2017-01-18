class AddTypeToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :type, :string
    add_index :subscribers, :type
  end
end
