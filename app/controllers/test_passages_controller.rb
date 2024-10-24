# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to @test_passage
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    url = result.html_url

    if url.present?
      Gist.create!(user_id: current_user.id,
                   question_id: @test_passage.current_question.id,
                   gist_url: url)

      flash[:notice] = t('.success', gist: view_context.link_to('Gist', url))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
