# frozen_string_literal: true

class AddUserRefToTests < ActiveRecord::Migration[7.1]
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
