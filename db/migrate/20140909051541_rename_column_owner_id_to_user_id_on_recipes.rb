class RenameColumnOwnerIdToUserIdOnRecipes < ActiveRecord::Migration
  def change
  	rename_column :recipes, :owner_id, :user_id
  end
end
