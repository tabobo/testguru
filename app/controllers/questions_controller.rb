# frozen_string_literal: true

class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @questions = @test.questions
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found, layout: false
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
