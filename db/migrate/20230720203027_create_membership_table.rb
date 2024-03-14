class CreateMembershipTable < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :person
      t.belongs_to :eventgroup
      t.string :role
      t.timestamps
    end
    # Add a unique constraint on the combination of person_id and eventgroup_id
    add_index :memberships, [:person_id, :eventgroup_id], unique: true
  end
end
