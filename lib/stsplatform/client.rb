require "stsplatform/version"

module STSPlatform

  class Client < RequestHandler
    def initialize(config=nil)
      super(nil)
      unless config.nil?
        self.set_config(config)
      end
    end
  end

end
