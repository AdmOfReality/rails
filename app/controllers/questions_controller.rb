class QuestionsController < ApplicationController

  before_action :find_question, only: %i[ show ]

rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  def index
    # @question = @test.questions.all
  end

  def show; end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_questions_not_found
    render plain: 'Questions was not found!'
  end
end
