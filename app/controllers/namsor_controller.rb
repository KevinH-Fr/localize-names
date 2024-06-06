class NamsorController < ApplicationController
  def index
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
