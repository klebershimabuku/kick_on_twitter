require 'sinatra'
require './kick_on_twitter/search_results'

class App < Sinatra::Base
end

get '/search/tweets.json' do
  content_type :json
  SearchResults.search(params).to_json
end
