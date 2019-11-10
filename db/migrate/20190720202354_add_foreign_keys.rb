# frozen_string_literal: true

class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :questions, :tests
    add_foreign_key :answers, :questions
  end
end
