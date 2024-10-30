class AddDefaultFalseToSuccessInTestPassages < ActiveRecord::Migration[7.1]
  def change
    change_column_null :test_passages, :success, false
  end
end
