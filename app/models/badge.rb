class Badge < ApplicationRecord
  belongs_to :badge_rule

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, presence: true
  validates :badge_rule, presence: true

  def self.check_and_award_badges(test_passage)
    badges = []

    Badge.all.each do |badge|
      puts "Проверяем бейдж: #{badge.name}"

      if badge.badge_rule.rule_satisfied?(test_passage)
        puts "Присваиваем бейдж: #{badge.name}"
        badges << badge
      else
        puts "Бейдж не удовлетворяет условиям: #{badge.name}"
      end
    end

    badges.each do |badge|
      UserBadge.create!(user: test_passage.user, badge:)
      puts "Бейдж присвоен: #{badge.name}"
    end

    badges
  end
end
