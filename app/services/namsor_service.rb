class NamsorService
    include HTTParty
    base_uri 'https://v2.namsor.com/NamSorAPIv2'
  
    def initialize(api_key)
      @headers = {
        "X-API-KEY" => api_key,
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }
    end
  
    def origin_full_batch(personal_names)
      options = {
        headers: @headers,
        body: { personalNames: personal_names }.to_json
      }
      self.class.post("/api2/json/originFullBatch", options)
    end
  end
  