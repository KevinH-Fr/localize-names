class HomeController < ApplicationController
  before_action :set_forebears_service

  def index
    @name = params[:name]

    if @name.present?
      #geneanet parsor
      base_url = "https://www.geneanet.org/nom-de-famille/#{@name}" # Replace with your dynamic base URL if needed
      scraper = NameMeaningScraper.new(base_url)
      @meaning = scraper.extract_meaning

      #worldnames parsor
      #base_url = "https://apps.cdrc.ac.uk/worldnames/" # Replace with your dynamic base URL if needed
      #scraper = WorldNamesScraper.new(base_url)
      #@name_data = scraper.extract_data

      #behind the name api
      behind_the_name_service = BehindTheNameService.new(api_key)
      @name_info = behind_the_name_service.lookup(params[:name])

      #namsor api
      api_key = Rails.application.credentials.namsor[:api_key]
      namsor_service = NamsorService.new(api_key)
      
      if params[:name].present?
        personal_names = [{ name: params[:name] }]
        response = namsor_service.origin_full_batch(personal_names)
      
        if response.success?
          @data = response.parsed_response
        else
          @error = response.message
        end
      end
  
      
    end
  end

  private

  def set_forebears_service
    @forebears_service = ForebearsService.new(Rails.application.credentials.namsor[:forebears_api_key])
  end

  def api_key
    Rails.application.credentials.behindthename[:behindthename_api_key]
 end

end
