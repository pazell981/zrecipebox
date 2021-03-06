class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :quantity
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
