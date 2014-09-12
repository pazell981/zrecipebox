class ChangeTableRecipeCategories < ActiveRecord::Migration
  def change
  	rename_table :recipes_categories, :recipe_categories
  end
end
