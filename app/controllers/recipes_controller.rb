class RecipesController < ApplicationController

  before_action :require_login, :set_categories

  has_scope :title
  has_scope :category
  has_scope :favorite

  def index
    respond_to do |format|
      format.html{
        @subtitle = "My Recipes"
        @alphabet = ('a'..'z').to_a
        @recipes={}
        @alphabet.each do |a|
          @recipes[a]=Recipe.where("user_id=#{current_user.id} AND LOWER(title) LIKE '#{a}%'").order('title')
        end
        @categories = Category.where("user_id = #{current_user.id}")
        @recipe = Recipe.new
      }
      format.json{
        @allrecipes = Recipe.joins('LEFT JOIN recipe_categories ON recipes.id = recipe_categories.recipe_id').joins('LEFT JOIN favorites ON recipes.id = favorites.recipe_id').where("recipes.user_id=#{current_user.id}")
        render :json => JSON.generate(@allrecipes.as_json)
      }
    end
  end

  def create
    params[:recipe][:category_ids].reject!{|c| c.empty?}
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      if params[:recipe][:category_ids]
        params[:recipe][:category_ids].each do |c|
          @recipe_categories = RecipeCategory.new(:recipe_id => @recipe.id, :category_id => c)
          @recipe_categories.save
        end
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
      redirect_to recipes_path
    else
      @subtitle = "My Recipes"
      @alphabet = ('a'..'z').to_a
      @recipes={}
      @alphabet.each do |a|
        @recipes[a]=Recipe.where("user_id=#{current_user.id} AND LOWER(title) LIKE '#{a}%'").order('title')
      end
      @categories = Category.where("user_id = #{current_user.id}")
      render :index
    end
  end

  def show
    @subtitle = "My Recipes"
    @liked = Favorite.find_by_user_id_and_recipe_id(current_user.id, params[:id])
    @like = Favorite.new
    @comment = Comment.new
    @recipe = Recipe.joins('LEFT JOIN recipe_categories ON recipes.id = recipe_categories.recipe_id').includes(:categories).joins('LEFT JOIN favorites ON recipes.id = favorites.recipe_id').find(params[:id])
    @comments = Comment.includes(:user).where(recipe_id: params[:id])
  end

  def edit
    @subtitle = "My Recipes"
    @recipe = Recipe.joins('LEFT JOIN recipe_categories ON recipes.id = recipe_categories.recipe_id').joins('LEFT JOIN favorites ON recipes.id = favorites.recipe_id').find(params[:id])
  end

  def update
    params[:recipe][:category_ids].reject!{|c| c.empty?}
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

  private

  def set_categories
    @categories = current_user.categories.all
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :description, :yield, :actual_time, :total_time, :category_ids, :category, :source, :image, :public, :favorite, :ingredients, :instructions)
  end
end
