class CommentsController < ApplicationController
  def index
    @all_comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)

      if @comment.save
        redirect_to comments_path
      else
        p @comment.errors
      end
  end



  private

  def comment_params
    params.require(:comment).permit([:content,:user])
  end
end
