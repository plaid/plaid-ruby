# frozen_string_literal: true

module Plaid
  module Institutions
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns a JSON response containing details on all financial institutions currently supported by Plaid. Because
      # Plaid supports thousands of institutions, results are paginated.
      #
      # If there is no overlap between an institution's enabled products and a client's enabled products, then the
      # institution will be filtered out from the response. As a result, the number of institutions returned may not
      # match the count specified in the call.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Institution` in the
      # `institutions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as
      # a `Plaid::Types::InstitutionsGetResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Institutions::Types::InstitutionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.institutions.get(
      #     count: 1,
      #     offset: 1,
      #     country_codes: ["US"]
      #   )
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::OffsetItemIterator.new(
          initial_page: params[:offset],
          item_field: :institutions,
          has_next_field: nil,
          step: true
        ) do |next_page|
          params[:offset] = next_page
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "institutions/get",
            body: Plaid::Institutions::Types::InstitutionsGetRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Plaid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            begin
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::InstitutionsGetResponse.load(response.body))
            rescue ::JSON::ParserError
              raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
            end
            [parsed_response, response]
          else
            error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
            error_types = {
              400 => Plaid::Types::PlaidError,
              401 => Plaid::Types::PlaidError,
              429 => Plaid::Types::PlaidError,
              500 => Plaid::Types::PlaidError,
              (400..499) => Plaid::Types::PlaidError,
              (500..599) => Plaid::Types::PlaidError
            }
            error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
            raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
          end
        end
      end

      # Returns a JSON response containing details for institutions that match the query parameters, up to a maximum of
      # ten institutions per query. Institutions that Plaid does not support for new connections are not included in
      # search results, but can still be retrieved by ID with `/institutions/get_by_id`.
      #
      # Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the
      # `client_id` and `secret` parameters to authenticate to this endpoint. The `public_key` parameter has since been
      # deprecated; all customers are encouraged to use `client_id` and `secret` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Institutions::Types::InstitutionsSearchRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.institutions.search(
      #     query: "query",
      #     country_codes: ["US"]
      #   )
      #
      # @return [Plaid::Types::InstitutionsSearchResponse]
      def search(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "institutions/search",
          body: Plaid::Institutions::Types::InstitutionsSearchRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::InstitutionsSearchResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end

      # Returns a JSON response containing details on a specified financial institution.
      #
      # Institutions that Plaid does not support for new connections are still returned by this endpoint, so that an
      # `institution_id` stored on an existing Item can still be looked up. These institutions are not returned by
      # `/institutions/get` or `/institutions/search`, and attempting to create a new Item for one of them returns an
      # `INSTITUTION_NO_LONGER_SUPPORTED` error. Use `connection_availability` to tell the two cases apart.
      #
      # Versioning note: API versions 2019-05-29 and earlier allow use of the `public_key` parameter instead of the
      # `client_id` and `secret` to authenticate to this endpoint. The `public_key` has been deprecated; all customers
      # are encouraged to use `client_id` and `secret` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Institutions::Types::InstitutionsGetByIDRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.institutions.get_by_id(
      #     institution_id: "institution_id",
      #     country_codes: ["US"]
      #   )
      #
      # @return [Plaid::Types::InstitutionsGetByIDResponse]
      def get_by_id(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "institutions/get_by_id",
          body: Plaid::Institutions::Types::InstitutionsGetByIDRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::InstitutionsGetByIDResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end
    end
  end
end
