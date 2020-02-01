# frozen_string_literal: true

class ChangeColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :email
  end
end
