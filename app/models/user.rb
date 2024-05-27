class User < ApplicationRecord
  has_many :my_tests, class_name: 'Test', foreign_key: :owner_id, inverse_of: :owner
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  scope :by_level, -> (level) { joins(:my_test).where(tests: {level: level}) }

  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_list_tests_by_level(level)
    my_tests.where(level: level).pluck(:title)
  end

  def self.list_by_level(level)
    by_level(level).pluck(:title)
  end
end

