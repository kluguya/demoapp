class RemoveUniqueIndexFromMemberships < ActiveRecord::Migration[7.0]
  def change
    remove_index :memberships, name: "index_memberships_on_person_id_and_eventgroup_id"
  end
end
