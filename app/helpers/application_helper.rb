# frozen_string_literal: true

module ApplicationHelper

  def current_year
    @year ||= Time.now.year
  end
  
end
