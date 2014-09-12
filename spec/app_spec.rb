require 'spec_helper'

describe App do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'GET /search/tweets.json' do
    get '/search/tweets.json'
    expect(last_response.header['Content-Type']).to eq('application/json')
  end
end
