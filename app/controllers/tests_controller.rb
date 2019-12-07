# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    render json: { tests: Test.all }
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    if @test.errors.empty?
      redirect_to @test
    else
      render 'new'
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
