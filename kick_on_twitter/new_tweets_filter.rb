class NewTweetsFilter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def apply
    tt = Proc.new do
      tweets.each.inject([]) do |list, tweet|
      list << tweet if tweet["in_reply_to_screen_name"].empty?
      list
      end
    end

    tt.call
  end
end
