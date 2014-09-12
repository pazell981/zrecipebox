class RenameTableRecipesToRecipe < ActiveRecord::Migration
  def change
  	rename_table(:recipes, :recipe)
  end
end
