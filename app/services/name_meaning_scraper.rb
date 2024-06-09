class NameMeaningScraper
    attr_reader :url, :selected_content
  
    def initialize(url)
      @url = url
      scrape_page
    end
  
    private
  
    def scrape_page
      response = HTTParty.get(url)
      return unless response.success?
  
      doc = Nokogiri::HTML(response.body)
      # Select only the specific part of the page you're interested in
      selected_elements = doc.css('.namedef')
      @selected_content = selected_elements.map(&:text).join("\n")
    end
  end
  