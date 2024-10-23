class CreateBadgeRules < ActiveRecord::Migration[7.1]
  def change
    create_table :badge_rules do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
