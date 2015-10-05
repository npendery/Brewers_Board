class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :description
      t.string :rating, null: false
      t.belongs_to :user, null: false
      t.belongs_to :recipe, null: false

      t.timestamps null: false
    end
  end
end
