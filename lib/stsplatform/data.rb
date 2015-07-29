require "stsplatform/version"

module STSPlatform

  # The Data resource of the STS Platform API
  # Params:
  # +handler+:: a sensor object
  # +id+:: (optional) the id (timestamp of the data), only used to delete
  # Returns:
  # +STSPlatformResponse+:: object containing "data" and "code" parameters
  # Inherits from RequestHandler, with access to the get, post, put and delete methods.
  class Data < RequestHandler
    def initialize(handler, id="")
      super(handler,id)
    end
  end

end
