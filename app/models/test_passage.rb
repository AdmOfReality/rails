# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  scope :passed, -> { where(success: true) }

  def completed?
    current_question.nil? || timed_out?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.success = successful? && !timed_out?

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def current_rate
    (correct_questions * 100) / test.questions.count
  end

  def successful?
    current_rate >= SUCCESS_PERCENT
  end

  def time_left
    return nil unless test.duration > 0

    elapsed_time = Time.current.to_i - created_at.to_i
    remaining_time = test.duration * 60 - elapsed_time
    remaining_time.positive? ? remaining_time : 0
  end

  def timed_out?
    time_left.zero?
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present? && current_question.nil?
  end

  def before_validation_set_next_question
    self.current_question = next_question if new_record? == false
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
