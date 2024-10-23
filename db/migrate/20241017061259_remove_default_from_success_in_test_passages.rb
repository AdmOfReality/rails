class RemoveDefaultFromSuccessInTestPassages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :test_passages, :success, from: false, to: nil
  end
end
