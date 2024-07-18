class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = default_client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def gist_params
    {
      description: "A question about #{@test.title} from RailsApp",
      files: {
        'rails-app-question.txt' => {
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
