class ChangeStatusFormatInFriends < ActiveRecord::Migration
  def change
  	change_column :friends, :status, :binary
  end
end
