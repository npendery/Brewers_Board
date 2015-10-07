class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.string :body, null: false
      t.belongs_to :group, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
