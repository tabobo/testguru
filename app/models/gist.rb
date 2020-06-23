class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :question, presence: true
  validates :gist, presence: true
  validates :user, presence: true

end
