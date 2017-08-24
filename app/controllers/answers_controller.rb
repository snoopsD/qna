class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_question, only: [:new, :create]

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Your answer created'
      redirect_to @question
    else
      flash[:notice] = 'Your answer not created'
      render :new
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
