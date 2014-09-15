require 'spec_helper'
describe TweetFormatter do
  let(:tweets) { JSON.parse(File.read('./spec/fixtures/tweet.json')) }
  
	describe '#call' do
		it 'formats' do
			f = TweetFormatter.call(tweets)
      expect(f.size).to eq(2)

			expect(f[0][:screen_name]).to eq('dion_roob')
			expect(f[0][:followers_count]).to eq(391)
			expect(f[0][:retweet_count]).to eq(0)
			expect(f[0][:favourites_count]).to eq(63)
			expect(f[0][:text]).to eq('@gerardo_kihn Use the auxiliary AGP application, then you can synthesize the online port!')
			expect(f[0][:created_at]).to eq('Mon Sep 24 03:35:21 +0000 2012')
		end
	end
end
