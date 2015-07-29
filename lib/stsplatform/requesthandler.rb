require "stsplatform/version"
require 'net/http'
require 'json'

module STSPlatform

  # Main handler of the library. Defines successors in the chain of responsibility
  # and in our case handles the REST requests to the STS Platform.
  class RequestHandler
    attr_accessor :url, :_successor, :resource, :auth

    def initialize(successor=nil,id="")
      @url = "http://wotkit.sensetecnic.com/api"
      @_successor = successor
      resource =  self.class.name.downcase.split('::').last || ''
      @resource = "/#{resource}/#{id.to_s}"
      @auth = nil
    end

    def set_config(config)
      if config.has_key?(:url)
        unless /http:\/\//.match(config[:url]).nil?
          @url = config[:url]
        else
          raise STSPlatform::STSPlatformError.new("Malformed URL string")
        end
      end
      if config.has_key?(:auth)
        unless config[:auth].has_key?(:username) || config[:auth].has_key?(:key_id)
            raise STSPlatform::STSPlatformError.new("Malformed Auth Hash. Must contain username or key_id")
        end
        if config[:auth].has_key?(:username)
          @auth = {key_id:config[:auth][:username],key_password:config[:auth][:password]}
        elsif config[:auth].has_key?(:key_id)
          @auth = config[:auth]
        end
      end

    end

    def set_handler(handler)
      @_successor = handler
    end

    def get(params=nil,resource="")
      unless @_successor.nil?
        return @_successor.get(params,@resource + resource)
      else
        uri = URI.parse(@url+resource)
        uri.query = URI.encode_www_form(handle_params(params))
        req = Net::HTTP::Get.new(uri)
        unless handle_authentication().nil?
          req.basic_auth auth[:key_id].to_s, auth[:key_password].to_s
        end
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return handle_response(res)
      end
    end

    def post(payload=nil,resource="")
      unless @_successor.nil?
        return @_successor.post(payload,@resource + resource)
      else
        uri = URI.parse(@url+resource)
        req = Net::HTTP::Post.new(uri, initheader={'Content-Type'=>'application/json'})
        req.body = handle_payload(payload)
        unless handle_authentication().nil?
          req.basic_auth auth[:key_id].to_s, auth[:key_password].to_s
        end
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return handle_response(res)
      end
    end

    def put(payload=nil,resource="")
      unless @_successor.nil?
        return @_successor.put(payload,@resource + resource)
      else
        uri = URI.parse(@url+resource)
        req = Net::HTTP::Put.new(uri, initheader={'Content-Type'=>'application/json'})
        req.body = handle_payload(payload)
        unless handle_authentication().nil?
          req.basic_auth auth[:key_id].to_s, auth[:key_password].to_s
        end
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return handle_response(res)
      end
    end

    def delete(payload=nil,resource="")
      unless @_successor.nil?
        return @_successor.delete(payload,@resource + resource)
      else
        uri = URI.parse(@url+resource)
        req = Net::HTTP::Delete.new(uri, initheader={'Content-Type'=>'application/json'})
        req.body = handle_payload(payload)
        unless handle_authentication().nil?
          req.basic_auth auth[:key_id].to_s, auth[:key_password].to_s
        end
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return handle_response(res)
      end
    end

    private

      def handle_response(response)
        return STSPlatform::STSPlatformResponse.new(response)
      end

      def handle_authentication()
        #if need handle authentication do it here
        return @auth
      end

      def handle_params(params)
        if params.nil?
          return {}
        else
          return params
        end
      end

      def handle_payload(payload)
        pay = handle_params(payload)
        begin
          return JSON.generate(pay)
        rescue
          raise STSPlatform::STSPlatformError.new("Malformed payload")
        end
      end

  end

end
