class Gist < ApplicationRecord
  belongs_to :user
  has_many :questions
end
