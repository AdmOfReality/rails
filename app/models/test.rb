# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level:).order(title: :desc) }

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: }).order(title: :asc)
  }

  validates :title, presence: true
  validates :level, :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'Only uniq title for each level' }


  def self.get_category(title)
    by_category(title).pluck(:title)
  end
end
