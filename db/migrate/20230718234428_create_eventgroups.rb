class CreateEventgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :eventgroups do |t|
      t.string :name

      t.timestamps
    end
  end
end
