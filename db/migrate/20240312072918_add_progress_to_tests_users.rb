class AddProgressToTestsUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :tests_users, :progress, :integer, default: 0
  end
end
