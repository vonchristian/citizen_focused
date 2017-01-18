class AddEnterpriseScaleToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :businesses, :enterprise_scale, foreign_key: true
  end
end
