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

    def error_handler(err,res=nil)
      case err
        when 'Bad Request'
          raise 'The request was malformed. Did you check the API docs?'
        when 'Unauthorized'
          raise 'Access denied: Try using the correct credentials.'
        when 'Request Failed'
          raise 'Request Failed'
        when 'Not Found'
          raise 'Not Found'
        when 'Institution not supported'
          raise 'Institution not supported'
        when 'Corrupted token'
          raise 'It appears that the access_token has been corrupted'
        else
          raise err
      end
    end

    protected

    def build_uri(path,option=nil)
      path = path + '/' + option unless option.nil?
      URI.parse(self.instance_variable_get(:'@environment_location') + path)
    end

    private

    def parse_response(res)
      body = JSON.parse(res.body)
      case res.code.delete('.').to_i
        when 200
          return body
        when 201
          return { msg: 'Requires further authentication', body: body}
        when 400
          error_handler('Bad Request',res)
        when 401
          error_handler('Institution not supported',res) if body['code'] == 1108
          error_handler('Corrupted token',res) if body['code'] == 1105
          error_handler('Not Found',res) if body['code'] == 1501
          error_handler('Unauthorized',res)
        when 402
          return {msg: 'User account is locked', body: body} if body['code'] == 1205
          error_handler('Request Failed', res)
        when 404
          error_handler('Not Found',res)
        else
          error_handler('Server Error',res)
      end
    end
  end
end