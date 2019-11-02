# frozen_string_literal: true

class AddTestsLevelDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, 1)
  end
end
