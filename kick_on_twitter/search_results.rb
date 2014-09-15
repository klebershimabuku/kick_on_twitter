require 'json'
require 'net/http'
require './kick_on_twitter/mention_parser'
require './kick_on_twitter/new_tweets_filter'
require './kick_on_twitter/sorter'
require './kick_on_twitter/tweet_formatter'

class SearchResults

  ENDPOINT = 'http://xxxcnn0330.locaweb.com.br/tweeps'

  def self.search(params)
    uri = URI(ENDPOINT)
    uri.query = URI.encode_www_form(params)
    req = Net::HTTP::Get.new(uri)
    req['Username'] = 'klebershimabuku@gmail.com'

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
	    http.request(req)
    }

    tweets = res.body

    req = MentionParser.new(tweets: tweets, mention: params[:q]).parse
    req = NewTweetsFilter.new(tweets).apply
    req = TweetFormatter.call(tweets)

    Sorter.apply(req)
  end
end
