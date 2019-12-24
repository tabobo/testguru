class AnswersController < ApplicationController

  #before_action :find_question, only: %i[new create]
  #before_action :set_answer, only: %i[show edit update destroy]

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answer.question, notice: 'Answer was successfully destroyed.'
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
      @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:answer, :correct)
  end

end
