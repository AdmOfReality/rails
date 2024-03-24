class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true

  validate :validate_count_of_answers, on: :create

  def validate_count_of_answers
    errors.add(:base, :answers, "max answers is 4") if answers.count >= 4
  end
end
