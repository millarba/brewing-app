class CommentsController < ApplicationController

  def create
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]

    if current_user
      @comment = @commentable.comments.new(
                              user_id: current_user.id,
                              text: params[:text]
                              )
      @comment.save
      redirect_back(fallback_location: :new)
    else
      flash[:warning] = "You most be logged in to comment"
      redirect_to "/login"
    end
  end

end
