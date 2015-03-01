class VotesController < ApplicationController

	def upvote 
		@parent = Question.find(params[:question_id]) if params[:question_id]
    	@parent = Answer.find(params[:answer_id]) if params[:answer_id]
		@vote = Vote.new

		if params[:question_id]
      		parent = Question.find(params[:question_id])
      		q_id = parent.id
    	else
      		parent = Answer.find(params[:answer_id])
      		q_id = parent.question.id
    	end

    	new_vote = parent.votes.build(upvote_params)
    	if 	new_vote.save
        	redirect_to question_path(q_id)
    	else
      		p new_vote.errors
    	end
  	end

	def downvote 
		@parent = Question.find(params[:question_id]) if params[:question_id]
	    @parent = Answer.find(params[:answer_id]) if params[:answer_id]
		@vote = Vote.new
		if params[:question_id]
	     	parent = Question.find(params[:question_id])
	      	q_id = parent.id
    	else
		    parent = Answer.find(params[:answer_id])
		    q_id = parent.question.id
    	end
    		p @parent
    	new_vote = @parent.votes.build(downvote_params)
    	if new_vote.save
    		redirect_to question_path(q_id)
    	else
    		p new_vote.errors
    	end
	end

	private

	def upvote_params
		params.require(:vote).permit(:user_id, is_upvote?: true)
	end

	def downvote_params
		params.require(:vote).permit(:user_id, is_upvote?: false)
	end
end