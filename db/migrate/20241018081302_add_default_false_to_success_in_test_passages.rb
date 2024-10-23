class AddDefaultFalseToSuccessInTestPassages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :test_passages, :success, from: nil, to: false
  end
end
