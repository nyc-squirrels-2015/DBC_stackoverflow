class QuestionsController < ApplicationController

  before_filter :ensure_current_user
  skip_before_filter :ensure_current_user, :only => [:index]

  def show
    @question = Question.find_by(id: params[:id])
    @answers = Answer.find_by(question_id: params[:id]) 
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to_question_path(@question)
    else
      redirect_to '/error'
    end
  end

  def edit
    @question = Question.find_by(question_id: params[:id])
  end

  def update
    @question = Question.find_by(question_id: params[:id])
    if @question.save
      redirect_to_question_path(@question)
    else
      redirect_to '/error'
    end
  end

  def destroy
    question = Question.find_by(question_id: params[:id])
    question.destroy
    redirect_to '/'
  end

  private

  def questions_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end