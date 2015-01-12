require 'net/http'
require 'json'
require 'uri'
module Plaid
  module Util

    def post(path,username,password,type,options={})
      uri = build_uri(path)
      res = Net::HTTP.post_form(uri, {client_id: self.instance_variable_get(:'@customer_id') ,secret: self.instance_variable_get(:'@secret'), username: username, password: password, type: type})
      parse_response(res)
    end

    def get(path,id=nil)
      uri = build_uri(path,id)
      res = Net::HTTP.get(uri)
      parse_response(res)
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
        else
          raise err
      end
    end

    protected

    def build_uri(path,id=nil)
      id ? URI.parse(self.instance_variable_get(:'@environment_location') + path + id) :
           URI.parse(self.instance_variable_get(:'@environment_location') + path)
    end

    private

    def parse_response(res)
      body = JSON.parse(res.body)
      case res.code
        when '200'
          return body
        when '201'
          return { msg: 'Requires further authentication', body: body}
        when '400'
          error_handler('Bad Request',res)
        when '401'
          error_handler('Unauthorized',res)
        when '402'
          if body['code'] == 1205
            return { msg: 'User account is locked', body: body }
          else
            error_handler('Request Failed',res)
          end
        when '404'
          error_handler('Not Found',res)
        else
          error_handler('Server Error',res)
      end
    end
  end
end