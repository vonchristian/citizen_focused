class AddTypeOfOrganizationToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :businesses, :type_of_organization, foreign_key: true
  end
end
