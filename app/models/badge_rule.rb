class BadgeRule < ApplicationRecord
  has_many :badges

  validates :name, presence: true

  PREDEFINED_RULES = [
    { name: 'all_backend_tests',
      description: 'Выдать бейдж после успешного прохождения всех тестов категории Backend' },
    { name: 'first_attempt', description: 'Выдать бейдж после успешного прохождения теста с первой попытки' },
    { name: 'all_level_tests',
      description: 'Выдать бейдж после успешного прохождения всех тестов определённого уровня' },
    { name: 'all_sql_tests', description: 'Выдать бейдж после успешного прохождения всех тестов категории SQL' },
    { name: 'all_full_stack_tests',
      description: 'Выдать бейдж после успешного прохождения всех тестов категории Full Stack' }
  ].freeze

  def rule_satisfied?(test_passage)
    return false if test_passage.nil? || test_passage.user.nil?

    case name
    when 'all_backend_tests'
      user_completed_all_backend_tests?(test_passage.user)
    when 'first_attempt'
      first_attempt_successful?(test_passage)
    when 'all_level_tests'
      user_completed_all_level_tests?(test_passage.user, test_passage.test.level)
    when 'all_sql_tests'
      user_completed_all_sql_tests?(test_passage.user)
    when 'all_full_stack_tests'
      user_completed_all_full_stack_tests?(test_passage.user)
    else
      false
    end
  end

  private

  def user_completed_all_backend_tests?(user)
    backend_tests = Test.by_category('Backend')
    completed_tests = user.test_passages.passed.map(&:test_id).last(1)
    backend_tests.pluck(:id).all? { |test_id| completed_tests.include?(test_id) }
  end

  def first_attempt_successful?(test_passage)
    user_test_attempts = TestPassage.where(user: test_passage.user, test: test_passage.test).count
    user_test_attempts == 1 && test_passage.successful?
  end

  def user_completed_all_level_tests?(user, level)
    level_tests = Test.where(level:)
    completed_tests = user.test_passages.passed.pluck(:test_id).uniq
    level_tests.pluck(:id).all? { |test_id| completed_tests.include?(test_id) }
  end

  def user_completed_all_sql_tests?(user)
    sql_tests = Test.by_category('SQL')
    completed_tests = user.test_passages.passed.map(&:test_id).last(1)
    sql_tests.pluck(:id).all? { |test_id| completed_tests.include?(test_id) }
  end

  def user_completed_all_full_stack_tests?(user)
    full_stack_tests = Test.by_category('Full stack')
    completed_tests = user.test_passages.passed.map(&:test_id).last(1)
    full_stack_tests.pluck(:id).all? { |test_id| completed_tests.include?(test_id) }
  end
end
