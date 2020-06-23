# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_one :gist

  validates :body, presence: true, uniqueness: true
end
