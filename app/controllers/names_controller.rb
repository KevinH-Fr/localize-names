# app/controllers/names_controller.rb

class NamesController < ApplicationController
  def lookup
    if params[:name].present?
      behind_the_name_service = BehindTheNameService.new(api_key)
      @name_info = behind_the_name_service.lookup(params[:name])
    end
  end

  private

  def api_key
     Rails.application.credentials.behindthename[:behindthename_api_key]
  end
end
