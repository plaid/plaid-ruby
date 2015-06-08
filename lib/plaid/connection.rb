require 'net/http'
require 'json'
require 'uri'
module Plaid
  class Connection
    class << self
      # API: semi-private
      def post(path, options = {})
        uri = build_uri(path)
        options.merge!(client_id: Plaid.customer_id, secret: Plaid.secret)
        res = Net::HTTP.post_form(uri,options)
        parse_response(res)
      end

      # API: semi-private
      def get(path, id = nil)
        uri = build_uri(path,id)
        res = Net::HTTP.get(uri)
        parse_get_response(res)
      end

      # API: semi-private
      def secure_get(path, access_token, options = {})
        uri = build_uri(path)
        options.merge!({access_token:access_token})
        req = Net::HTTP::Get.new(uri)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        parse_response(res)
      end

      # API: semi-private
      def patch(path, options = {})
        uri = build_uri(path)
        options.merge!(client_id: Plaid.customer_id, secret: Plaid.secret)
        req = Net::HTTP::Patch.new(uri)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
        parse_response(res)
      end

      # API: semi-private
      def delete(path, options = {})
        uri = build_uri(path)
        options.merge!(client_id: Plaid.customer_id, secret: Plaid.secret)
        req = Net::HTTP::Delete.new(uri)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
      end

      # API: semi-private
      # TODO: Refactor these to use symbols instead of strings
      def error_handler(err, res = nil)
        case err
        when 'Bad Request'
          puts res.body
          raise 'The request was malformed. Did you check the API docs?'
        when 'Unauthorized'
          raise 'Access denied: Try using the correct credentials.'
        when 'Corrupted token'
          raise 'It appears that the access token has been corrupted'
        else
          raise err
        end
      end

      protected

      # API: semi-private
      def build_uri(path, option = nil)
        path = path + '/' + option unless option.nil?
        URI.parse(Plaid.environment_location + path)
      end

      private

      def parse_response(res)
        body = JSON.parse(res.body)
        case res.code.delete('.').to_i
        when 200 then body
        when 201 then { msg: 'Requires further authentication', body: body}
        when 400 then error_handler('Bad Request',res)
        when 401
          case body['code']
          when 1108 then error_handler('Institution not supported', res)
          when 1105 then error_handler('Corrupted token', res)
          when 1106 then error_handler('Corrupted public_token', res)
          when 1107 then error_handler('Missing public_token', res)
          when 1501 then error_handler('Not Found', res)
          else error_handler('Unauthorized',res)
          end
        when 402
          return {msg: 'User account is locked', body: body} if body['code'] == 1205
          error_handler('Request Failed', res)
        when 404
          error_handler('Not Found',res)
        else
          error_handler('Server Error',res)
        end
      end

      def parse_get_response(res)
        body = JSON.parse(res)
        return body if body.kind_of?(Array)

        case body['code']
        when nil
          body
        when 1301, 1401, 1501, 1601
          error_handler('Not Found',body)
        else
          body
        end
      end

    end
  end
end
