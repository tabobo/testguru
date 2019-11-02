# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  scope :tests_by_level, lambda { |level|
    joins(:tests).where(tests: { level: level }).distinct
  }

  validates :name, presence: true
end
