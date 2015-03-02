class VotesController < ApplicationController

  def index
    @parent = Question.find(params[:question_id]) if params[:question_id]
    @parent = Answer.find(params[:answer_id]) if params[:answer_id]
    @votes = Vote.all
    @parent_votes = @parent.votes.all
  end
  
  def new 
    @parent = Question.find(params[:question_id]) if params[:question_id]
    @parent = Answer.find(params[:answer_id]) if params[:answer_id]
    @vote = Vote.new
  end

  def create
      if params[:question_id]
        parent = Question.find(params[:question_id])
        q_id = parent.id
      else
        parent = Answer.find(params[:answer_id])
        q_id = parent.question.id
      end
        p @parent
        new_vote = parent.votes.build(vote_params)
      
      if new_vote.save
        redirect_to question_path(q_id)
      else
        p new_vote.errors
      end
  end

  private
  
  def vote_params
    params.require(:vote).permit(:user_id, is_upvote?: true)
  end


end