class CreateUsersInGroups < ActiveRecord::Migration
  def change
    create_table :users_in_groups do |t|
      t.belongs_to :user, null: false
      t.belongs_to :group, null: false

      t.timestamps null: false
    end
  end
end
