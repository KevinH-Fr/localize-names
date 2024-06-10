# app/controllers/names_controller.rb

class NamesController < ApplicationController
  def lookup
    if params[:name].present?
      behind_the_name_service = BehindTheNameService.new(api_key)
      @name_info = behind_the_name_service.lookup(params[:name])
    end
  end

  def show
    @name = 'negre' # Or get the name from params
    base_url = "https://www.behindthename.com/name/smith" # Replace with your base URL
    @scraper = NameMeaningScraper.new(base_url)

  end


  private

  def api_key
     Rails.application.credentials.behindthename[:behindthename_api_key]
  end
end



