class ChangeColumnStatusInFriendsToString < ActiveRecord::Migration
  def change
  	change_column :favorites, :favorite, :string
  	change_column :favorites, :like, :string
  	change_column :friends, :status, :string
  end
end
