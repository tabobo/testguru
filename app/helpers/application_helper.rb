# frozen_string_literal: true

module ApplicationHelper
  def current_year
    @year ||= Time.now.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
