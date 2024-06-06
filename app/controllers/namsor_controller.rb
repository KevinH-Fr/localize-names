class NamsorController < ApplicationController
  def index
    api_key = Rails.application.credentials.namsor[:api_key]
    namsor_service = NamsorService.new(api_key)
    
    personal_names = [
      {
        id: "e630dda5-13b3-42c5-8f1d-648aa8a21c42",
        name: "Keith Haring"
      }
    ]

    response = namsor_service.origin_full_batch(personal_names)

    if response.success?
      @data = response.parsed_response
    else
      @error = response.message
    end
  end

end
