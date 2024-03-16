class RenameTestsColumnUserIdToOwnerId < ActiveRecord::Migration[7.1]
  def change
    rename_column :tests, :user_id, :owner_id
  end
end
