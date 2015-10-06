class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
    add_index :groups, :name
  end
end
