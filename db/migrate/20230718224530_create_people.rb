class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :groupname
      t.string :role

      t.timestamps
    end
  end
end
