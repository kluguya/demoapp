class Udpateindexonmembership < ActiveRecord::Migration[7.0]
  def change
    remove_index :memberships, column: [:person_id, :eventgroup_id]
    add_index :memberships, [:person_id, :eventgroup_id], name: "index_memberships_on_person_id_and_eventgroup_id"
  end
end
