class ChangeRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :malt_grains, :string
    remove_column :recipes, :hops_schedule, :string
    remove_column :recipes, :directions, :string
    remove_column :recipes, :yeast, :string
    add_column :recipes, :style, :string, null: false
    add_column :recipes, :ingredients, :string, null: false
    add_column :recipes, :instructions, :string, null: false
    add_column :recipes, :yielder, :string, null: false
  end

  def down
    add_column :recipes, :malt_grains, :string
    add_column :recipes, :hops_schedule, :string
    add_column :recipes, :directions, :string
    add_column :recipes, :yeast, :string
    remove_column :recipes, :style, :string
    remove_column :recipes, :ingredients, :string
    remove_column :recipes, :instructions, :string
    remove_column :recipes, :yield, :string
  end
end
