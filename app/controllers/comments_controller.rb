class CommentsController < ApplicationController

  protect_from_forgery

  def create
    # binding.pry
    @comment = Comment.create(comment_params)
    render json: @comment, status: 201
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :gift_id)
  end



end
