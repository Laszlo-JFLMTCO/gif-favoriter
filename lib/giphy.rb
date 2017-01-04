require 'net/http'
require 'json'

class Giphy

  GIPHY_MAIN_URL = "http://api.giphy.com"
  API_KEY = "?api_key=dc6zaTOxFJmzC"
  PATH_RANDOM = "/v1/gifs/random"
  PATH_ADDON_KEYWORD = "&tag="

  class << self; attr_accessor :search_mode, :keyword, :limit_results end

  def initialize(search_mode = "random", keyword = nil, limit_results = 1)
    @search_mode = search_mode
    @keyword = keyword
    @limit_resuls = limit_results
  end

  def json_parser(url)
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
  end

  def add_keyword(keyword)
    return "" if keyword.nil?
    PATH_ADDON_KEYWORD + keyword
  end

  def random
    url = GIPHY_MAIN_URL + PATH_RANDOM + API_KEY + add_keyword(@keyword)
    json_parser(url)["data"]
  end

end
