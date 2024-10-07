class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, presence: true
  validates :image, presence: true

  enum rule: {
    all_backend_tests: 0,
    first_attempt_success: 1,
    all_level_tests: 2
  }

  def self.check_and_award_badges(user, test_passage)
    Badge.all.each do |badge|
      case badge.rule
      when "all_backend_tests"
        award_badge(user, badge) if user_completed_all_backend_tests?(user)
      when "first_attempt_success"
        award_badge(user, badge) if first_attempt_success?(user, test_passage)
      when "all_level_tests"
        award_badge(user, badge) if user_completed_all_level_tests?(user, test_passage.test.level)
      end
    end
  end

  private

  def self.user_completed_all_backend_tests?(user)
    backend_tests = Test.where(category: 'Backend')
    completed_tests = user.test_passages.passed.where(test: backend_tests).pluck(:test_id).uniq
    backend_tests.pluck(:id).sort == completed_tests.sort
  end

  def self.first_attempt_success?(user, test_passage)
    test_passage.passed? && user.test_passages.where(test: test_passage.test).count == 1
  end

  def self.user_completed_all_level_tests?(user, level)
    level_tests = Test.where(level: level)
    completed_tests = user.test_passages.passed.where(test: level_tests).pluck(:test_id).uniq
    level_tests.pluck(:id).sort == completed_tests.sort
  end

  def self.award_badge(user, badge)
    UserBadge.create(user: user, badge: badge)
  end
end
end
