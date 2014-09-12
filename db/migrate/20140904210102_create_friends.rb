class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :status
      t.references :user1, index: true
      t.references :user2, index: true

      t.timestamps
    end
  end
end
