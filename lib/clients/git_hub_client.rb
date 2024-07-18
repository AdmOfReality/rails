# class GitHubClient
#   ROOT_ENDPOINT = 'https://api.github.com'.freeze
#   ACCESS_TOKEN = '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'.freeze

#   def initialize
#     @http_client = setup_http_client
#   end

#   def create_gist(params)
#     @http_client.post('gists') do |request|
#       request.body = params.to_json
#     end
#   end

#   private

#   def setup_http_client
#     Faraday.new(url: ROOT_ENDPOINT,
#       headers: {
#         'Content-Type' => 'application/json',
#         'Authorization' => "token #{ACCESS_TOKEN}"
#       }
#     )
#   end
# end
