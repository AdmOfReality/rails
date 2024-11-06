class BadgeRule < ApplicationRecord
  has_many :badges

  validates :name, presence: true

  # PREDEFINED_RULES = [
  #   { name: 'all_backend_tests',
  #     description: 'Выдать бейдж после успешного прохождения всех тестов категории Backend' },
  #   { name: 'first_attempt', description: 'Выдать бейдж после успешного прохождения теста с первой попытки' },
  #   { name: 'all_level_tests',
  #     description: 'Выдать бейдж после успешного прохождения всех тестов определённого уровня' },
  #   { name: 'all_sql_tests', description: 'Выдать бейдж после успешного прохождения всех тестов категории SQL' },
  #   { name: 'all_full_stack_tests',
  #     description: 'Выдать бейдж после успешного прохождения всех тестов категории Full Stack' }
  # ].freeze

  def rule_satisfied?(test_passage)
    return false if test_passage.nil? || test_passage.user.nil?

    case name
    when 'all_backend_tests'
      return false if test_passage.test.category.title != 'Backend'

      user_completed_all_backend_tests?(test_passage.user)
    when 'first_attempt'
      first_attempt_successful?(test_passage)
    when 'all_level_tests'
      user_completed_all_level_tests?(test_passage.user, test_passage.test.level)
    when 'all_sql_tests'
      return false if test_passage.test.category.title != 'SQL'

      user_completed_all_sql_tests?(test_passage.user)
    when 'all_full_stack_tests'
      return false if test_passage.test.category.title != 'Full stack'

      user_completed_all_full_stack_tests?(test_passage.user)
    else
      false
    end
  end

  private

  def user_completed_all_backend_tests?(user)
    backend_tests_ids = Test.by_category('Backend').pluck(:id)
    # [19, 4]
    completed_tests = user.test_passages.passed.pluck(:test_id)
    # [19, 4, 19, 4, 3, 1]
    filtered_completed_tests = completed_tests.select { |test_id| backend_tests_ids.include?(test_id) }
    # [19, 4, 19, 4]
    backend_tests_ids.size == filtered_completed_tests.uniq.size && filtered_completed_tests.tally.values.uniq.one?
    # [2] == [2] && [19, 4, 19, 4].tally.values = [2, 2], [2, 2].uniq.one? = true
  end

  def first_attempt_successful?(test_passage)
    user_test_attempts = TestPassage.where(user: test_passage.user, test: test_passage.test).count
    user_test_attempts == 1 && test_passage.successful?
  end

  def user_completed_all_level_tests?(user, level)
    level_tests_ids = Test.by_level(level).pluck(:id)
    completed_tests = user.test_passages.passed.pluck(:test_id)
    filtered_completed_tests = completed_tests.select { |test_id| level_tests_ids.include?(test_id) }
    level_tests_ids.size == filtered_completed_tests.uniq.size && filtered_completed_tests.tally.values.uniq.one?
  end

  def user_completed_all_sql_tests?(user)
    sql_tests_ids = Test.by_category('SQL').pluck(:id)
    completed_tests = user.test_passages.passed.pluck(:test_id)
    filtered_completed_tests = completed_tests.select { |test_id| sql_tests_ids.include?(test_id) }
    sql_tests_ids.size == filtered_completed_tests.uniq.size && filtered_completed_tests.tally.values.uniq.one?
  end

  def user_completed_all_full_stack_tests?(user)
    full_stack_tests_ids = Test.by_category('Full stack').pluck(:id)
    completed_tests = user.test_passages.passed.pluck(:test_id)
    filtered_completed_tests = completed_tests.select { |test_id| full_stack_tests_ids.include?(test_id) }
    full_stack_tests_ids.size == filtered_completed_tests.uniq.size && filtered_completed_tests.tally.values.uniq.one?
  end
end
