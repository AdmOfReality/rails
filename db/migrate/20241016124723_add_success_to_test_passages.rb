class AddSuccessToTestPassages < ActiveRecord::Migration[7.1]
  def change
    add_column :test_passages, :success, :boolean, default: false
  end
end
