class AddAdminToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :owner_id, :integer, null: false
  end
end
