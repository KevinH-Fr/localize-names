require 'nokogiri'
require 'open-uri'

class WorldNamesScraper
  def initialize(base_url)
    @base_url = base_url
  end

  def extract_data
    html_content = URI.open(@base_url).read
    doc = Nokogiri::HTML(html_content)
    
  end
end
