# frozen_string_literal: true

class AddCorrectToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :correct, :boolean
  end
end
