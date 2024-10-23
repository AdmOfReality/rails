class AddBadgeRuleToBadges < ActiveRecord::Migration[7.1]
  def change
    add_reference :badges, :badge_rule, null: false, foreign_key: true
  end
end
