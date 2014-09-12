class RenameColumnUserIdToUser1IdOnFriends < ActiveRecord::Migration
  def change
  	rename_column :friends, :user_id, :user1_id
  end
end
