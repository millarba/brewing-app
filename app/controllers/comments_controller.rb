class CommentsController < ApplicationController
  before_action :find_commentable

  def index

  end

  def new
    @comment = Comment.new
  end

  def create
    if current_user
      @recipe = Recipe.find(params[:recipe_id])
      @comment = Comment.new(
                              user_id: current_user.id,
                              text: params[:text]
                              )
      @comment.save
      redirect_to "/recipes/#{@recipe.id}"
    else
      flash[:warning] = "You most be logged in to comment"
      redirect_to "/login"
    end
  end

private

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]
  end

end
