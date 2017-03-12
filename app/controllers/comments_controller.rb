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
                              text: params[:text],
                              commentable_type: params[:commentable_type],
                              commentable_id: params[:commentable_id]
                              )
      @comment.save
      redirect_to "/recipes/#{@recipe.id}"
    else
      flash[:warning] = "You most be logged in to comment"
      redirect_to "/login"
    end
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Recipe.find(params[:recipe_id]) if params[:recipe_id]
  end

end
