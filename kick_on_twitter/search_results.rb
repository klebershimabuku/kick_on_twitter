require 'json'

class SearchResults
  def self.search(params)
    params.to_json
  end
end
