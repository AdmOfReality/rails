# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_email|
#     MovieGenre.find_or_create_by!(email: genre_email)
#   end

# Category.destroy_all

# categories = Category.create!([
#                                 { title: 'Backend' },
#                                 { title: 'SQL' },
#                                 { title: 'Full stack' }
#                               ])

# BadgeRule.destroy_all

BadgeRule.predefined_rules.each do |rule_data|
  BadgeRule.find_or_create_by!(name: rule_data[:name]) do |rule|
    rule.description = rule_data[:description]
  end
end
