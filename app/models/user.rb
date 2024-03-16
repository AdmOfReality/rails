class User < ApplicationRecord
  # has_many :my_tests, class_name: "Test", foreign_key: :owner_id
  has_many :my_test, class_name: 'Test', foreign_key: :owner_id, inverse_of: :owner
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_list_tests_by_level(level)
    Test.joins("INNER JOIN users on (tests.owner_id = users.id)").where(tests: {level: level})
  end
end

