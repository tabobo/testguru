# frozen_string_literal: true

class ChangeColumnsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question_id, :test_id
    rename_column :answers, :answer_id, :question_id
  end
end
