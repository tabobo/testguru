# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :get_test, only: %i[show edit update destroy]
  before_action :find_test, only: %i[new create]
  # rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.questions.build
  end

  def edit; end

  def create
    @question = @test.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to admin_test_path(@test), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to admin_test_path(@test, @question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to admin_test_path(@test), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def get_test
    @test = @question.test
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found, layout: false
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
