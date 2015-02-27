class CommentsController < ApplicationController
  def index
    @all_comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @parent = Question.find(params[:question_id]) if params[:question_id]
    @parent = Answer.find(params[:answer_id]) if params[:answer_id]
    @comment = Comment.new
  end

  def create
    if params[:question_id]
      parent = Question.find(params[:question_id])
      q_id = parent.id
    else
      parent = Answer.find(params[:answer_id])
      q_id = parent.question.id
    end

    new_comment = parent.comments.build(comment_params)
    if new_comment.save
        redirect_to question_path(q_id)
      else
        p new_comment.errors
      end
  end



  private

  def comment_params
    p params[:comment]
    params.require(:comment).permit(:content, :user_id)

  end
end
