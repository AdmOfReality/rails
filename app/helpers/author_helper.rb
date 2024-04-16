module AuthorHelper
  def github_url(author, repo)
    link_to "#{author}", "https://github.com/#{author}/#{repo}", target: :_blank
  end
end
