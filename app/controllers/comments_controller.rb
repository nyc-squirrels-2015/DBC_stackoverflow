class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
  end



  private

  def comment_params
    params.require(:comment).permit([:content,:user,:commentable])
  end
end
