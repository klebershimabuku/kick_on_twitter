require 'json'
require 'net/http'
require './kick_on_twitter/mention_parser'

class SearchResults

  ENDPOINT = 'https://api.twitter.com/1.1/search/tweets.json'

  def self.search(params)
    uri = URI(ENDPOINT)
    uri.query = URI.encode_www_form(params)
    tweets = Net::HTTP.get(uri)

    MentionParser.new(tweets: tweets, mention: params[:q]).parse
  end
end
