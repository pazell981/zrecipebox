class FavoritesController < ApplicationController
  def create
  	@like=Favorite.new(like_params)
  	@like.save
  	redirect_to :back
  end

  private
  def like_params
    params.require(:favorite).permit(:user_id, :recipe_id, :like)
  end

end
