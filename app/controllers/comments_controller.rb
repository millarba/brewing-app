class CommentsController < ApplicationController
  before_action :find_commentable

  def index
    @comments = Comment.where(commentable_id: 4)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
                            text: params[:text],
                            commentable_type: params[:commentable_type],
                            commentable_id: @commentable.id
                            )
    @comment.save

    redirect_to "/recipes/#{@commentable.id}"
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Recipe.find(params[:recipe_id]) if params[:recipe_id]
  end

end
