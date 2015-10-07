class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, null: false
      t.belongs_to :group, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.date :date, null: false
      t.string :time, null: false

      t.timestamps null: false
    end
  end
end
