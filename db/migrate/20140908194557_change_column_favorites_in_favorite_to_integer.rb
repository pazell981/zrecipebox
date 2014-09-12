class ChangeColumnFavoritesInFavoriteToInteger < ActiveRecord::Migration
  def change
  	change_column :favorites, :favorite, :integer
  	change_column :favorites, :like, :integer
  end
end
