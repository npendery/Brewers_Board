class AddRecipeTable < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :malt_grains, null: false
      t.string :hops_schedule, null: false
      t.string :directions, null: false
      t.string :yeast, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
