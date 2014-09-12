class RenameColumnUser1IdToUserIdOnFriends < ActiveRecord::Migration
  def change
  	rename_column :friends, :user1_id, :user_id
  end
end
