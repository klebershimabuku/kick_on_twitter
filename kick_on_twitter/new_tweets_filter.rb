class NewTweetsFilter
  attr_reader :tweets

  def initialize(tweets)
    @tweets = JSON.parse tweets
  end

  def apply
    tt = Proc.new do
      tweets["statuses"].each.inject([]) do |list, tweet|
      list << tweet if tweet["in_reply_to_screen_name"].empty?
      list
      end
    end

    tt.call
  end
end
