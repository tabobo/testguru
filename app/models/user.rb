# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  scope :tests_by_level, lambda { |level|
    joins(:tests).where(tests: { level: level }).distinct
  }

  validates :name, presence: true
end

private

def digest(string)
  Digest::SHA1.hexdigest(string)
end