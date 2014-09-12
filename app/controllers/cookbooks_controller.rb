class CookbooksController < ApplicationController
  
	before_action :require_login

	def index
		respond_to do |format|
		  format.html{
		    @subtitle = "My Recipes"
		    @alphabet = ('a'..'z').to_a
		    @cookbooks = Recipe.where("recipes.public!='yes'").paginate(page: params[:page], per_page: 15).order('created_at DESC')
		    @recipebox = RecipeBox.new
		  }
		  format.json{
		    @allrecipes = Recipe.joins('LEFT JOIN recipe_categories ON recipes.id = recipe_categories.recipe_id').joins('LEFT JOIN favorites ON recipes.id = favorites.recipe_id').where("recipes.user_id=#{current_user.id}")
		    render :json => JSON.generate(@allrecipes.as_json)
		  }
		end
	end

  def require_login
    unless signed_in?
      deny_access
    end
  end
  
end
