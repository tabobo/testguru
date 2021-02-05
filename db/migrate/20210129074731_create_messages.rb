class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.string :message, null: false

      t.timestamps
    end
  end
end
