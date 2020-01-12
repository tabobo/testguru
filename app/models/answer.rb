# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers

  private

  def validate_max_answers
    errors.add(:question, 'One qestion can have not more than 4 answers') if question.answers.count > 4
  end
end
