class AddUniqueIndexToMemberships < ActiveRecord::Migration[7.0]
  def change
    add_index :memberships, [:person_id, :eventgroup_id], unique: true
  end
end
