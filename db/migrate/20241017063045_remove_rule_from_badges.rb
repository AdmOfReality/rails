class RemoveRuleFromBadges < ActiveRecord::Migration[7.1]
  def change
    remove_column :badges, :rule, :integer
  end
end
