class AddColumnIngredientsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :text
  end
end
