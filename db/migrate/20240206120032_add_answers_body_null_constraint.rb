class AddAnswersBodyNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:answers, :body, false)
  end
end
