class QuestionsController < ApplicationController

  before_filter :ensure_current_user

  skip_before_filter :ensure_current_user, :only => [:index, :show]

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
      redirect_to question_path(@question)
    else
      redirect_to '/error'
    end
  end

  def edit
    @question = Question.find_by(params[:id])
  end

  def update
    @question = Question.find_by(params[:id])
    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      redirect_to '/error'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to '/'
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :user_id)
  end
end
