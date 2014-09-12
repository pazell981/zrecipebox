class FriendsboxController < ApplicationController
  
	before_action :require_login

  def index
  	respond_to do |format|
  	  format.html{
  	    @subtitle = "Your Friend's Recipes"
  	    @alphabet = ('a'..'z').to_a
  	    @recipes={}
  	    @alphabet.each do |a|
  	      @recipes[a]=Recipe.joins("LEFT JOIN friends ON recipes.user_id = friends.friend_id").where("friends.user_id=#{current_user.id} AND recipes.title LIKE '#{a}%' AND recipes.public!='yes'")
  	    @categories = Category.where("user_id = #{current_user.id}")
  	    end
  	  }
  	  format.json{
  	    @friendrecipes = Recipe.joins("LEFT JOIN friends ON recipes.user_id = friends.friend_id").where("friends.user_id=#{current_user.id}")
  	    render :json => JSON.generate(@friendrecipes.as_json)
  	  }
  	end
  end

  def show
    @like = Favorite.new
    @liked = Favorite.find_by_user_id_and_recipe_id(current_user.id, params[:id])
    @bookmarked = RecipeBox.find_by_user_id_and_recipe_id(current_user.id, params[:id])
    @bookmark = RecipeBox.new
    @recipe = Recipe.find(params[:id])
    @comments = Comment.where(recipe_id: params[:id])
    @comment = Comment.new
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

end
