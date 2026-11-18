# frozen_string_literal: true

module Plaid
  module Identity
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/identity/get` endpoint allows you to retrieve various account holder information on file with the
      # financial institution, including names, emails, phone numbers, and addresses. Only name data is guaranteed to be
      # returned; other fields will be empty arrays if not provided by the institution.
      #
      # Note: In API versions 2018-05-22 and earlier, the `owners` object is not returned, and instead identity
      # information is returned in the top level `identity` object. For more details, see [Plaid API
      # versioning](https://plaid.com/docs/api/versioning/#version-2019-05-29).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Identity::Types::IdentityGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.identity.get(access_token: "access_token")
      #
      # @return [Plaid::Types::IdentityGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "identity/get",
          body: Plaid::Identity::Types::IdentityGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IdentityGetResponse.load(response.body))
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

      # Use `/identity/documents/uploads/get` to retrieve identity details when using [Identity Document
      # Upload](https://plaid.com/docs/identity/identity-document-upload/).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Identity::Types::IdentityDocumentsUploadsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.identity.get_document_uploads(access_token: "access_token")
      #
      # @return [Plaid::Types::IdentityDocumentsUploadsGetResponse]
      def get_document_uploads(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "identity/documents/uploads/get",
          body: Plaid::Identity::Types::IdentityDocumentsUploadsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IdentityDocumentsUploadsGetResponse.load(response.body))
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

      # The `/identity/match` endpoint generates a match score, which indicates how well the provided identity data
      # matches the identity information on file with the account holder's financial institution.
      #
      # Fields within the `balances` object will always be null when retrieved by `/identity/match`. Instead, use the
      # free `/accounts/get` endpoint to request balance cached data, or `/accounts/balance/get` or `/signal/evaluate`
      # for real-time data.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Identity::Types::IdentityMatchRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.identity.match(access_token: "access_token")
      #
      # @return [Plaid::Types::IdentityMatchResponse]
      def match(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "identity/match",
          body: Plaid::Identity::Types::IdentityMatchRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IdentityMatchResponse.load(response.body))
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

      # Returns a chronological history of Link-originated Identity Match attempts for a client, ordered by creation
      # time with the oldest attempt first.
      #
      # This endpoint requires separate enablement in addition to access to Identity Match. To request endpoint access,
      # contact your account manager or [submit a product access support
      # ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access).
      #
      # Results are retained for up to one year. Attempts marked as deleted are omitted.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::IdentityMatchListAttempt` in the
      # `identity_match_attempts` field of every page, requesting pages as they are needed. Call `pages` on it to get
      # each page as a `Plaid::Types::IdentityMatchListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Identity::Types::IdentityMatchListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.identity.list_matches(
      #     start_time: "2024-01-15T09:30:00Z",
      #     end_time: "2024-01-15T09:30:00Z"
      #   )
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_matches(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :identity_match_attempts,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "identity/match/list",
            body: Plaid::Identity::Types::IdentityMatchListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::IdentityMatchListResponse.load(response.body))
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

      # `/identity/refresh` is an optional endpoint for users of the Identity product. It initiates an on-demand
      # extraction to fetch the most up to date Identity information from the Financial Institution. This on-demand
      # extraction takes place in addition to the periodic extractions that automatically occur for any Identity-enabled
      # Item. If changes to Identity are discovered after calling `/identity/refresh`, Plaid will fire a webhook
      # [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/identity/#default_update).
      #
      # As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid
      # endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors,
      # you may find it necessary to adjust your timeout period when making requests.
      #
      # `/identity/refresh` is offered as an add-on to Identity and has a separate [fee
      # model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit
      # a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Identity::Types::IdentityRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.identity.refresh(access_token: "access_token")
      #
      # @return [Plaid::Types::IdentityRefreshResponse]
      def refresh(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "identity/refresh",
          body: Plaid::Identity::Types::IdentityRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IdentityRefreshResponse.load(response.body))
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

      # @return [Plaid::Verification::Client]
      def verification
        @verification ||= Plaid::Identity::Verification::Client.new(client: @client)
      end
    end
  end
end
