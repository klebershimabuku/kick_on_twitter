require 'spec_helper'

describe App do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:json_response) { File.read('./spec/fixtures/tweets.json') }

  it 'GET /search/tweets.json' do
    stub_request(:get, "https://api.twitter.com/1.1/search/tweets.json?q=@locaweb").
      with(:headers => {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'api.twitter.com', 'User-Agent'=>'Ruby'
    }).to_return(:status => 200, :body => json_response, :headers => {})

    get '/search/tweets.json?q=@locaweb'
    expect(last_response.header['Content-Type']).to eq('application/json')

    body = JSON.parse last_response.body
    expect(body["statuses"].size).to eq(21)
  end
end
