require 'json'

module STSPlatform

  # A custom response object from our library
  # Params:
  # +response+:: an Net::HTTP error response
  # Returns:
  # +STSPlatformResponse+:: object containing "data" and "code" parameters
  class STSPlatformResponse
    attr_accessor :data, :code
    def initialize(response)
      begin
        @data = JSON.parse(response.body)
      rescue
        @data = nil
      ensure
        @code = response.code
      end
    end
  end
end
