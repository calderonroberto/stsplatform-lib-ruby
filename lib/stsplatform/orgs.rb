require "stsplatform/version"

module STSPlatform

  # The Orgs resource of the STS Platform API
  # Params:
  # +handler+:: a client object
  # +id+:: (optional) the numerical or string id of the organization
  # Returns:
  # +STSPlatformResponse+::  object containing "data" and "code" parameters
  # Inherits from RequestHandler, with access to the get, post, put and delete methods.
  class Orgs < RequestHandler
    def initialize(handler, id="")
      super(handler,id)
    end
  end

end
