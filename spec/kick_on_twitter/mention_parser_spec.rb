require 'spec_helper'
describe MentionParser do
  let(:tweets) do
    {
      "statuses" => [
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
    }
  end

  describe "#parse" do
    it "returns tweets that mention for the 'Locaweb' user" do
      caller = MentionParser.new(tweets: tweets.to_json, :mention => "@locaweb").parse

      expect(caller.size).to eq(3)
    end
  end
end
