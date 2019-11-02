# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :test_passages
  has_many :questions
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than: 0 }

  validate :validate_max_level, on: :create

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, ->(level) { where(level: level) }

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
