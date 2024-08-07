# frozen_string_literal: true

class ChangeColumnDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :answers, :correct, from: nil, to: true
    change_column_default :tests, :level, from: nil, to: 0
  end
end
