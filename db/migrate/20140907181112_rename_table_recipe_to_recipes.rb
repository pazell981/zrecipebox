class RenameTableRecipeToRecipes < ActiveRecord::Migration
  def change
  	rename_table :recipe, :recipes
  end
end
