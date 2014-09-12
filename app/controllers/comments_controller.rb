class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(comment_params)
  	if @comment.save 
			redirect_to recipe_path(params[:comment][:recipe_id])
		else
			flash[:errors] = @comment.errors.full_messages
			redirect_to recipe_path(params[:comment][:recipe_id])
		end
  end

  private
  def comment_params
  	params.require(:comment).permit(:author_id, :recipe_id, :comment)
  end
end
