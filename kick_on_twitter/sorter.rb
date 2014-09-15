class Sorter 
  attr_reader :tweets

  def self.apply(tweets)
    sorter = new(tweets)

    sorter.most_followed
    #sorter.most_retweeted
    #sorter.most_favorited
  end

  def initialize(tweets)
    @tweets = tweets
  end

  def most_followed
    tweets.sort_by { |t| t[:followers_count] }.reverse
  end

  def most_retweeted
    priority = 1
  end

  def most_favorited
    priority = 1
  end
end
