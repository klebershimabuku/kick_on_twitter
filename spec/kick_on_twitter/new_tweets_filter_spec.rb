require 'spec_helper'
require './kick_on_twitter/new_tweets_filter'

describe NewTweetsFilter do
  let(:tweets) do
    [
        {
          "entities" => { "user_mentions" => [ {"screen_name"=>"locaweb"} ] },
          "in_reply_to_screen_name" => "locaweb"
        },
        {
          "entities" => { "user_mentions" => [ {"screen_name"=>"locaweb"} ] },
          "in_reply_to_screen_name" => "",
        },
        {
          "entities" => { "user_mentions" => [ {"screen_name"=>"locaweb"} ] },
          "in_reply_to_screen_name" => "locaweb"
        },
        {
          "entities" => { "user_mentions" => [ {"screen_name"=>"random"} ] },
          "in_reply_to_screen_name" => "random"
        }
    ]
  end

  it 'returns only new tweets' do
    filter = NewTweetsFilter.new(tweets).apply
    expect(filter.size).to eq(1)
  end

end
