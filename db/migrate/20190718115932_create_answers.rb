# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :answer_id

      t.timestamps
    end
  end
end
