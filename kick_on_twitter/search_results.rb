require 'json'
require 'net/http'

class SearchResults

  ENDPOINT = 'https://api.twitter.com/1.1/search/tweets.json'

  def self.search(params)
    uri = URI(ENDPOINT)
    Net::HTTP.get(uri)
  end
end
