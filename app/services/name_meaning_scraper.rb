require 'nokogiri'
require 'open-uri'

class NameMeaningScraper
  def initialize(base_url)
    @base_url = base_url
  end

  def extract_meaning
    html_content = URI.open(@base_url).read
    doc = Nokogiri::HTML(html_content)
    
  # Find all elements with the class 'first-definition'
  first_definition_elements = doc.css('.first-defintion')
  
  # Initialize an empty string to store the extracted content
  content = ""
  
  # Concatenate the text content of all elements with the class 'first-definition'
  first_definition_elements.each do |element|
    content += element.text
  end
  
  content
    
  end
end
