# frozen_string_literal: true

class AddAuthorToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
