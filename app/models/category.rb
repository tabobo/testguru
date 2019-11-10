# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  default_scope { order(title: :desc) }
end
