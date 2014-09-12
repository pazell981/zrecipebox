class AddColumnLikeToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :like, :binary
  end
end
