# frozen_string_literal: true

BadgeRule::PREDEFINED_RULES.each do |rule_data|
  BadgeRule.find_or_create_by!(name: rule_data[:name]) do |rule|
    rule.description = rule_data[:description]
  end
end
