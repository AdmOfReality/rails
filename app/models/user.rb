class User < ApplicationRecord
  has_many :tests

  def show_list_tests_by_level(level)
    Test.joins("INNER JOIN users on (tests.user_id = users.id)").where(tests: {level: level})
  end
end
