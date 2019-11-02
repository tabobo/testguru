# frozen_string_literal: true

class AddTestsColumnCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true
  end
end
