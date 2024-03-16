class Test < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.sort_desc_test_name_by_category(title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: title}).order(title: :desc).pluck(:title)
  end
end

