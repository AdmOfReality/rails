# frozen_string_literal: true

class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:questions, :body, false)
  end
end
