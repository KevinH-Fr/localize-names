# app/services/forebears_service.rb

require 'httparty'

class ForebearsService
  include HTTParty
  base_uri 'https://forebears.io/api/v1' # Replace with the actual base URI of the Forebears API

  def initialize(api_key)
    @api_key = api_key
  end

  def get_name_data(name)
    options = { query: { name: name, api_key: @api_key } }
    self.class.get('/name', options) # Replace '/name' with the actual endpoint
  end
end
