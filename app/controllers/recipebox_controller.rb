class RecipeboxController < ApplicationController
  
  before_action :require_login

  def index
    respond_to do |format|
      format.html{
        @subtitle = "My Recipe Box"
        @alphabet = ('a'..'z').to_a
        @recipes={}
        @alphabet.each do |a|
          @recipes[a]=Recipe.joins("LEFT JOIN recipe_boxes ON recipes.id = recipe_boxes.recipe_id").where("(recipe_boxes.user_id=#{current_user.id} OR recipes.user_id=#{current_user.id}) AND recipes.title LIKE '#{a}%'")
        @categories = Category.where("user_id = #{current_user.id}")
        end
      }
      format.json{
        @recipes = Recipe.joins("LEFT JOIN recipe_boxes ON recipes.id = recipe_boxes.recipe_id").where("(recipe_boxes.user_id=#{current_user.id} OR recipes.user_id=#{current_user.id})")
        render :json => JSON.generate(@recipes.as_json)
      }
    end
  end

  def create
    @bookmark=RecipeBox.new(recipebox_params)
    @bookmark.save
    redirect_to recipebox_index_path
  end

  def show
    @subtitle = "My Recipe Box"
    @like = Favorite.new
    @liked = Favorite.find_by_user_id_and_recipe_id(current_user.id, params[:id])
    @comment = Comment.new
    @recipe=Recipe.find(params[:id])
  end

  def edit
    @subtitle = "My Recipe Box"
    @recipe=Recipe.includes(:favorites).find(params[:id])
  end

  def update
    params[:recipe][:category_ids].reject!{|c| c.empty?}
    @recipe = Recipe.new(recipe_params)
    params[:recipe][:category_ids].each do |c|
        @recipe_categories = RecipeCategory.new(:recipe_id => @recipe.id, :category_id => c)
        @recipe_categories.save
    end
    if params[:recipe][:category] != ""
      @category = Category.new(:category => params[:recipe][:category], :user_id => session[:user_id])
      @category.save
      @recipe_category = RecipeCategory.new(:recipe_id => @recipe.id, :category_id => @category.id)
      @recipe_category.save
    end
    if params[:recipe][:favorite] == "yes"
      @favorite = Favorite.new(:user_id => session[:user_id], :recipe_id => @recipe.id, :favorite => params[:recipe][:favorite])
      @favorite.save
    end
    redirect_to recipebox_path(params[:id])
  end

  def destroy
    @recipe = RecipeBox.find_by_user_id_and_recipe_id(current_user.id, params[:id])
    @recipe.destroy
    redirect_to recipebox_index_path
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

  private
  def recipebox_params
    params.require(:recipe_box).permit(:user_id, :recipe_id)
  end
end
