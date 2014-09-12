class AddColumnRecipeCategoryToRecipeBox < ActiveRecord::Migration
  def change
    add_reference :recipe_boxes, :recipe_category, index: true
  end
end
