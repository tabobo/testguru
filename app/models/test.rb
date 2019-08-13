class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :test_passages
  has_many :questions
  has_many :users, through: :test_passages

  def self.by_category(category_title)
    Test.joins(:category)
      .where(categories: { title: category_title }).order(title: :desc)
  end
end
