require 'sinatra'

class App < Sinatra::Base
end

get '/search/tweets.json' do
  content_type :json
  SearchResults.search(params)
end
