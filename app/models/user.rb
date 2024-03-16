class User < ApplicationRecord
  has_one :payment_account
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_list_tests_by_level(level)
    Test.joins("INNER JOIN users on (tests.user_id = users.id)").where(tests: {level: level})
  end
end
