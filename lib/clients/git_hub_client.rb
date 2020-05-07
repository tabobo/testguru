class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCES_TOKEN = '73e80a616bda6701cbc3c54c5bf40d73935bf54b'

  def initialize
    @http_client = setup_http_client
  end 

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCES_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end