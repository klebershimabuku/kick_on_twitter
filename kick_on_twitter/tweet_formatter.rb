class TweetFormatter
	attr_reader :tweets

  def self.call(tweets)
		f = new(tweets)
		f.format
  end

	def initialize(tweets)
		@tweets = JSON.parse tweets
	end

	def format
		output = []

		tweets["statuses"].each do |tweet|
			format = {}
			format.merge!(screen_name: tweet['user']['screen_name'])
			format.merge!(followers_count: tweet['user']['followers_count'])
			format.merge!(favourites_count: tweet['user']['favourites_count'])
			format.merge!(retweet_count: tweet['retweet_count'])
			format.merge!(text: tweet['text'])
			format.merge!(created_at: tweet['created_at'])
			
			output << format
		end

		output
	end
end
