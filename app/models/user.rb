class User < ApplicationRecord
  has_many :my_test, class_name: 'Test', foreign_key: :owner_id, inverse_of: :owner
  has_many :tests_users
  has_many :tests, through: :tests_users

  scope :by_level, -> (level) { joins(:my_test).where(tests: {level: level}) }

  validates :email, presence: true

  def show_list_tests_by_level(level)
    my_test.where(level: level).pluck(:title)
  end

  def self.list_by_level(level)
    by_level(level).pluck(:title)
  end
end

