class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category
      t.references :user, index: true

      t.timestamps
    end
  end
end
