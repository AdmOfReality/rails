# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show]

  def show; end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
