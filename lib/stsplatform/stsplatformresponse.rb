require 'json'

module STSPlatform
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
