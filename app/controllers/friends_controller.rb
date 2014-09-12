class FriendsController < ApplicationController
  
  before_action :require_login

  def index
  	@friends = Friend.includes(:user).where("(user_id = ? AND status = 'confirm') OR (friend_id = ? AND status = 'pending')", session[:user_id], session[:user_id])
  	@friend = Friend.new
  end

  def new
  	@addfriend = Friend.new
  	if (params.has_key?(:first_name) && params.has_key?(:last_name) && params.has_key?(:email))
	  	if params[:first_name] != "" || params[:last_name]
	  		@friendsearch =User.where("first_name = ? OR last_name = ?", params[:first_name], params[:last_name]) 
	  		render :new
	  	else
	  		@friendsearch =User.where("email = ?", params[:email]) 
	  		render :new
	  	end
	  end
  end

  def create
  	@friend = Friend.new(friend_params)
  	if @friend.save
  		redirect_to friends_path
  	else
  		render :new
  	end
  end

  def update
  	@friend = Friend.find(params[:id])
    if @friend.update(friend_params)
  	   @friend2 = Friend.new(user_id: @friend.friend_id, friend_id: @friend.user_id, status: "confirm")
       if @friend2.save
  	     redirect_to friends_path
       end
    end
  end

  def destroy
  	@friend = Friend.find(params[:id])
  	@friend.destroy
    redirect_to friends_path
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end

  private
  def friend_params
  	params.require(:friend).permit(:user_id, :friend_id, :status)
  end
end
