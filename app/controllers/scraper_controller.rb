class ScraperController < ApplicationController
  def index
    url = params[:url] || 'https://example.com'
    scraper = WebScraperService.new(url)
    @results = scraper.scrape
  end
end
