class Test < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> {where(level: 0..1)}
  scope :middle, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}

  scope :by_category, -> (title) { joins(:category).where(categories: { title: title }).order(title: :asc) }

  def self.get_category(title)
    by_category(title).pluck(:title)
  end
end

