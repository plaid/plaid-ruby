# frozen_string_literal: true

module Plaid
  module Errors
    class ResponseError < ApiError
      # Response headers keyed by lowercase name. Lookups ignore the name's capitalization, so
      # `headers["Retry-After"]` and `headers["retry-after"]` return the same values.
      class Headers < ::Hash
        # @param headers [Hash{String => Array<String>}]
        # @return [Headers]
        def self.from(headers)
          (headers || {}).each_with_object(new) { |(name, values), result| result[name] = values }
        end

        def [](name)
          super(normalize(name))
        end

        def []=(name, values)
          super(normalize(name), values)
        end

        def store(name, values)
          super(normalize(name), values)
        end

        def fetch(name, ...)
          super(normalize(name), ...)
        end

        def key?(name)
          super(normalize(name))
        end

        alias has_key? key?
        alias include? key?
        alias member? key?

        def dig(name, *rest)
          super(normalize(name), *rest)
        end

        def delete(name, &)
          super(normalize(name), &)
        end

        def values_at(*names)
          super(*names.map { |name| normalize(name) })
        end

        def fetch_values(*names, &)
          super(*names.map { |name| normalize(name) }, &)
        end

        private

        def normalize(name)
          name.to_s.downcase
        end
      end

      attr_reader :code, :body, :headers

      # @param msg [String] The raw response body.
      # @param code [Integer] The HTTP status code.
      # @param body [Object, nil] The response body parsed into the endpoint's declared error type, if any.
      # @param headers [Hash{String => Array<String>}] The response headers. Stored with lowercase names;
      #   lookups ignore capitalization.
      def initialize(msg, code:, body: nil, headers: {})
        @code = code
        @body = body
        @headers = Headers.from(headers)
        super(msg)
      end

      # Returns the first value of a response header, or nil when the response did not include it.
      #
      # @param name [String] The header name, in any capitalization (e.g. "Retry-After").
      # @return [String, nil]
      def header(name)
        Array(headers[name]).first
      end

      def inspect
        "#<#{self.class.name} @code=#{code} @body=#{message}>"
      end

      # Parses a raw error response body into the type declared for its status code.
      #
      # @param code [Integer]
      # @param raw_body [String, nil]
      # @param types [Hash{Integer, Range => Class}] Matchers in priority order.
      # @return [Object, nil] nil when no type matches or the body cannot be parsed.
      def self.load_error_body(code, raw_body, types)
        type = types.find { |matcher, _| matcher.is_a?(::Range) ? matcher.cover?(code) : matcher == code }&.last
        return nil if type.nil? || raw_body.to_s.empty?

        begin
          type.load(raw_body)
        rescue StandardError
          nil
        end
      end

      # Returns the most appropriate error class for the given code.
      #
      # @return [Class]
      def self.subclass_for_code(code)
        case code
        when 300..399
          RedirectError
        when 401
          UnauthorizedError
        when 403
          ForbiddenError
        when 404
          NotFoundError
        when 400..499
          ClientError
        when 503
          ServiceUnavailableError
        when 500..599
          ServerError
        else
          ResponseError
        end
      end
    end
  end
end
