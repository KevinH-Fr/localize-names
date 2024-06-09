# app/services/behind_the_name_service.rb

require 'net/http'
require 'json'

class BehindTheNameService
  BASE_URL = 'https://www.behindthename.com/api'

  def initialize(api_key)
    @api_key = api_key
  end

  def lookup(name)
    url = URI("#{BASE_URL}/lookup.json?name=#{name}&key=#{@api_key}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  end
end
