class ChangeColumnStatusInFriendsToInteger < ActiveRecord::Migration
  def change
  	change_column :friends, :status, :integer
  end
end
