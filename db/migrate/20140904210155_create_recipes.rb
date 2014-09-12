class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :yield
      t.time :actual_time
      t.time :total_time
      t.string :source
      t.binary :public
      t.text :instructions
      t.references :owner

      t.timestamps
    end
  end
end
