class AddRuleToBadge < ActiveRecord::Migration[7.1]
  def change
    add_column :badges, :rule, :integer
  end
end
