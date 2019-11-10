# frozen_string_literal: true

class AddAnswersCorrectDefault < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :correct, :boolean, default: false
  end
end
