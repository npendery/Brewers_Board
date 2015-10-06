class AddAdminToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :admin_id, :integer, null: false
  end
end
