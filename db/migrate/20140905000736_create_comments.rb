class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :author, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
