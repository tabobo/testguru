class CreateTestPassages < ActiveRecord::Migration[5.2]
  def change
    create_table :test_passages do |t|
      t.integer :user_id
      t.integer :test_id
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
