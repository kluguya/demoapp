class AddIndexToEventgroup < ActiveRecord::Migration[7.0]
  def change
    add_index :eventgroups, :name, unique: true
  end
end
