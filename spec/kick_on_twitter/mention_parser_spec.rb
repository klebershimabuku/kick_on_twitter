require 'spec_helper'
describe MentionParser do
  let(:tweets) do
    {
      "statuses" => [
        { "entities" => { "user_mentions" => [ {"screen_name"=>"random"} ] } },
        { "entities" => { "user_mentions" => [ {"screen_name"=>"locaweb"} ] } },
        { "entities" => { "user_mentions" => [ {"screen_name"=>"random"} ] } }
      ]
    }
  end

  describe "#parse" do
    it "returns tweets that mention for the 'Locaweb' user" do
      caller = MentionParser.new(tweets: tweets.to_json, :mention => "@locaweb").parse
      expect(caller.size).to eq(1)
    end
  end
end
