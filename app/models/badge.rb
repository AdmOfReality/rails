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

      if badge.badge_rule.rule_satisfied?(test_passage) && badge_applies_to_test?(badge, test_passage)
        puts "Присваиваем бейдж: #{badge.name}"
        badges << badge
      else
        puts "Бейдж не удовлетворяет условиям: #{badge.name}"
      end
    end

    badges.each do |badge|
      UserBadge.create!(user: test_passage.user, badge: badge)
      puts "Бейдж присвоен: #{badge.name}"
    end

    badges
  end

  def self.badge_applies_to_test?(badge, test_passage)
    case badge.badge_rule.name
    when 'all_backend_tests'
      test_passage.test.category.title == 'Backend'
    when 'first_attempt'
      true
    when 'all_level_tests'
      test_passage.test.level == test_passage.test.level
    when 'all_sql_tests'
      test_passage.test.category.title == 'SQL'
    when 'all_full_stack_tests'
      test_passage.test.category.title == 'Full Stack'
    else
      false
    end
  end
end
