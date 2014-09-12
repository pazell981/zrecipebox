class RenameTable < ActiveRecord::Migration
  def change
  	rename_table :categories_recipes, :recipes_categories
  end
end
