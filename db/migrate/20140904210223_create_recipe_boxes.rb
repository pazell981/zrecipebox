class CreateRecipeBoxes < ActiveRecord::Migration
  def change
    create_table :recipe_boxes do |t|
      t.references :recipe, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
