# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  SUCCESS_RATE = 85

  def success?
    percent_result >= SUCCESS_RATE
  end

  def percent_result
    correct_questions * 100 / test.questions.count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def progress_bar_valuenow
      test.questions.find_index(current_question) * 100 / test.questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers.count == correct_answers.where(id: answer_ids).count) &&
      correct_answers.count == answer_ids.count unless answer_ids.nil?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_next_question
    self.current_question = next_question
  end
end
