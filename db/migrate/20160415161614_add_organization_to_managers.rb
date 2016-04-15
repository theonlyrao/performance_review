class AddOrganizationToManagers < ActiveRecord::Migration
  def change
    add_reference :managers, :organization, index: true, foreign_key: true
  end
end
