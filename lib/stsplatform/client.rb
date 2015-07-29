require "stsplatform/version"

module STSPlatform


  # The base class of this library.
  # Params:
  # +config+:: (optional) a configuration dictionary
  # Returns:
  # +STSPlatformResponse+:: object containing "data" and "code" parameters
  # The configuration should be:
  # {
  #    "url": "http://wotkit.sensetecnic.com/api",
  #    "auth": {}
  # }
  # Auth should contain either username and password or oauth key, for example:
  # {"username":"john", "password":"smith"} or
  # {"oauth_key":"2341lkj2f12341"}

  class Client < RequestHandler
    def initialize(config=nil)
      super(nil)
      unless config.nil?
        self.set_config(config)
      end
    end
  end

end
