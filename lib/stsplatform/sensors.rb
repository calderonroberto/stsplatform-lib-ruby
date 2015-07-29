require "stsplatform/version"

module STSPlatform


  # The Sensors resource of the STS Platform API
  # Params:
  # +handler+:: a client object
  # +id+:: (optional) the numerical or string id of the sensor
  # Returns:
  # +STSPlatformResponse+:: object containing "data" and "code" parameters
  # Inherits from RequestHandler, with access to the get, post, put and delete methods.
  class Sensors < RequestHandler
    def initialize(handler, id="")
      super(handler,id)
    end
  end

end
