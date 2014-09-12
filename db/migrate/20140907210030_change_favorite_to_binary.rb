class ChangeFavoriteToBinary < ActiveRecord::Migration
  def change
  	add_column :favorites, :favorite, :binary
  end
end
