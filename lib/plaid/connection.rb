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
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.path)
        request.set_form_data(options)
        res = http.request(request)
        parse_response(res)
      end

      # API: semi-private
      def get(path, id = nil)
        uri = build_uri(path,id)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri.path)
        res = http.request(request)
        parse_get_response(res.body)
      end

      # API: semi-private
      def secure_get(path, access_token, options = {})
        uri = build_uri(path)
        options.merge!({access_token:access_token})
        req = Net::HTTP::Get.new(uri.path)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        parse_response(res)
      end

      # API: semi-private
      def patch(path, options = {})
        uri = build_uri(path)
        options.merge!(client_id: Plaid.customer_id, secret: Plaid.secret)
        req = Net::HTTP::Patch.new(uri.path)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        parse_response(res)
      end

      # API: semi-private
      def delete(path, options = {})
        uri = build_uri(path)
        options.merge!(client_id: Plaid.customer_id, secret: Plaid.secret)
        req = Net::HTTP::Delete.new(uri.path)
        req.body = URI.encode_www_form(options) if options
        req.content_type = 'application/x-www-form-urlencoded'
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
      end

      protected

      # API: semi-private
      def build_uri(path, option = nil)
        path = path + '/' + option unless option.nil?
        URI.parse(Plaid.environment_location + path)
      end

      private

      def parse_response(res)
        # unfortunately, the JSON gem will raise an exception if the response is empty
        raise Plaid::ServerError.new(res.code, res.msg, '') if res.body.to_s.length < 2
        # we got a response from the server, so parse it
        body = JSON.parse(res.body)
        case res.code.delete('.').to_i
        when 200 then body
        when 201 then { msg: 'Requires further authentication', body: body}
        when 400
          raise Plaid::BadRequest.new(body['code'], body['message'], body['resolve'])
        when 401
          raise Plaid::Unauthorized.new(body['code'], body['message'], body['resolve'])
        when 402
          raise Plaid::RequestFailed.new(body['code'], body['message'], body['resolve'])
        when 404
          raise Plaid::NotFound.new(body['code'], body['message'], body['resolve'])
        else
          raise Plaid::ServerError.new(body['code'], body['message'], body['resolve'])
        end
      end

      def parse_get_response(res)
        body = JSON.parse(res)
        return body if body.kind_of?(Array)

        case body['code']
        when nil
          body
        when 1301, 1401, 1501, 1601
          raise Plaid::NotFound.new(body['code'], body['message'], body['resolve'])
        else
          body
        end
      end

    end
  end
end
