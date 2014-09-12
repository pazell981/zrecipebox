class SessionsController < ApplicationController

	before_action :signed_in, except: :destroy

	def index
	  @subtitle = ""
	  @user = User.new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user.nil?
			flash[:error] = "A user with those credentials could not be found."
	    redirect_to :back
		else
			sign_in user
			redirect_to recipes_path
		end

	end

	def destroy
		sign_out
		redirect_to login_path
	end

	def signed_in
		if signed_in?
			redirect_to recipes_path
		end
	end

end
