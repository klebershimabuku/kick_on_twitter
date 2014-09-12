class MentionParser
  attr_reader :tweets, :user_mention, :mentioned_tweets

  def initialize(hash={})
    @tweets = JSON.parse(hash[:tweets])
    @user_mention = hash[:mention].split('@').last
    @mentioned_tweets = []
  end

  def parse
    tweets["statuses"].each do |tweet|
      user_mentions(tweet).each do |tt_mention|
        if find_mention(tt_mention)
          mentioned_tweets << tweet
        end
      end
    end

    mentioned_tweets
  end

  def user_mentions(tweet)
    tweet["entities"]["user_mentions"]
  end

  def find_mention(mention)
    mention.find { |k,v| v == user_mention }
  end
end
