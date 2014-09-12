require 'json'
require 'net/http'

class SearchResults

  ENDPOINT = 'https://api.twitter.com/1.1/search/tweets.json'

  def self.search(params)
    uri = URI(ENDPOINT)
    uri.query = URI.encode_www_form(params)
    Net::HTTP.get_response(uri)
  end
end
