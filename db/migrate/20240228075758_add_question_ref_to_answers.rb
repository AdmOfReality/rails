# frozen_string_literal: true

class AddQuestionRefToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_reference :answers, :question, foreign_key: true
  end
end
