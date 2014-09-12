class UsersController < ApplicationController
  
	before_action :require_login, except: :create

  def index
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  	  sign_in @user
  	  redirect_to recipes_path
  	else
  	  flash[:errors] = @user.errors.full_messages
      redirect_to :back
  	end
  end

  def show
  	@subtitle = @current_user.first_name + "'s Information"
  end

  def edit
  	@subtitle = "Edit User Information"
  	@user = @current_user
  end

  def update
  	@user = @current_user
  	if @user.update(user_params)
  	  redirect_to user_path(current_user.id)
  	else
  	  redirect_to :back
  	end
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end