require 'net/http'
require 'json'
require 'uri'
module Plaid
  module Util

    def post(path,options={})
      uri = build_uri(path)
      options.merge!({client_id: self.instance_variable_get(:'@customer_id') ,secret: self.instance_variable_get(:'@secret')})
      res = Net::HTTP.post_form(uri,options)
      parse_response(res)
    end

    def get(path,id=nil)
      uri = build_uri(path,id)
      res = Net::HTTP.get(uri)
      JSON.parse(res)
    end

    def error_handler(err)
      raise err
    end

    protected

    def build_uri(path,option=nil)
      path = path + '/' + option unless option.nil?
      URI.parse(self.instance_variable_get(:'@environment_location') + path)
    end

    private

    def parse_response(res)
      body = JSON.parse(res.body)
      unless body.nil?
        return body.merge( 'response_code' => res.code.delete('.').to_i )
      else
        error_handler "No Response"
      end
    end
  end
end