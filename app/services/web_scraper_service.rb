# app/services/web_scraper_service.rb

require "httparty" 
require "nokogiri"

class WebScraperService
  include HTTParty

  def initialize(url)
    @url = url
  end

  def scrape
    response = HTTParty.get(@url)
    if response.success?
      parse_html(response.body)
    else
      puts "Failed to retrieve the web page"
    end
  end

  private

  def parse_html(html)
    doc = Nokogiri::HTML(html)
    # Example: Extracting all the titles from h1 tags
    doc.css('h1').map(&:text)
  end
end
