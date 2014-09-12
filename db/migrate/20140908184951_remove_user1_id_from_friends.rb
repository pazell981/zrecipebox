class RemoveUser1IdFromFriends < ActiveRecord::Migration
  def change
  	remove_column :friends, :user1_id
  	remove_column :friends, :user2_id
  end
end
