class CreateTestsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id],  unique: true

    end
  end
end
