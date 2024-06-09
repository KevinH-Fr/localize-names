# app/controllers/forebears_controller.rb

class ForebearsController < ApplicationController
  before_action :set_forebears_service

  def index
    @name = params[:name] || 'John' # Default to 'John' if no name is provided
    response = @forebears_service.get_name_data(@name)

    if response.success?
      @name_data = response.parsed_response
    else
      @name_data = { error: 'Unable to fetch data' }
    end
  end

  private

  def set_forebears_service
    @forebears_service = ForebearsService.new(Rails.application.credentials.namsor[:forebears_api_key])
  end
end
