class RenameColumnUserIdToUser2IdOnFriends < ActiveRecord::Migration
  def change
  	rename_column :friends, :user_id, :user2_id
  end
end
