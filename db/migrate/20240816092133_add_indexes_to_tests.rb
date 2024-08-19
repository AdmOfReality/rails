class AddIndexesToTests < ActiveRecord::Migration[7.1]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
