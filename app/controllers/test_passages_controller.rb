# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def gist
    gist_service = GistQuestionService.new(current_user, @test_passage.current_question)
    result = gist_service.call
    
    flash_options = if gist_service.success?
      { notice: "Gist успешно сохранён! <a href='#{Gist.last.gist}'>link</a>" }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
