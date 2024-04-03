class QuestionsController < ApplicationController

  before_action :find_question, only: :show
  before_action :find_test, only: :index

  def index
    @questions = @test.questions.all
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_question
    @questions = Question.find(params[:id])
  end

end
