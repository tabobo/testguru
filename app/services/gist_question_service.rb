# frozen_string_literal: true

class GistQuestionService
  attr_reader :client

  def initialize(user, question, client = Octokit::Client.new(access_token: ENV['GITHUBCLIENT_ACCES_TOKEN']))
    @question = question
    @user = user
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_url
    @gist_url = @client.last_response.data.html_url
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
