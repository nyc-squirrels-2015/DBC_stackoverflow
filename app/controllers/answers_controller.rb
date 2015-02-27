class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find_by(id: params[:question_id])
    # @question = Question.create(title: 'test', content: 'what', user_id: 1, id: 1)
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to "/"
    else
      redirect_to '/error'
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    answer.destroy
    redirect_to '/'
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end

end
