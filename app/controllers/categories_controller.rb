class CategoriesController < ApplicationController
  
  before_action :require_login
  
  def index
    @subtitle = "Managing Categories"
    @categories = current_user.categories.all.order('category')
  end

  def new
    @subtitle = "Managing Categories"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @subtitle = "Managing Categories"
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

  private
  def category_params
    params.require(:category).permit(:user_id, :category)
  end
end
