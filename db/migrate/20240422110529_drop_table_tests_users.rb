class DropTableTestsUsers < ActiveRecord::Migration[7.1]
  def up
    drop_table :tests_users
  end
end
