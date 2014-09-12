class RenameColumnUser2IdToFriendIdOnFriends < ActiveRecord::Migration
  def change
  	rename_column :friends, :user2_id, :friend_id
  end
end
