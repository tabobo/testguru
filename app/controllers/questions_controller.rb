# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :get_test
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  # GET /questions
  def index
    @questions = @test.questions

    # render json: { questions: Question.all }

    # render file: 'public/about/about', layout: false

    # respond_to do |format|
    #   format.html { render plain: 'All questions' }
    #   format.json { render json: { questions: Question.all } }
    # end
  end

  # GET /questions/1
  def show
    # render plain: 'Show question"

    # redirect_to root_path
  end

  # GET /questions/new
  def new
    @question = @test.questions.build
  end

  # GET /quetions/1/edit
  def edit; end

  # POST /questions
  def create
    @question = @test.questions.build(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to test_path(@test), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to test_path(@test, @question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to test_path(@test), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = @test.questions.find(params[:id])
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found, layout: false
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
