# frozen_string_literal: true

module Plaid
  module Identity
    module Verification
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Create a new Identity Verification for the user specified by the `client_user_id` and/or `user_id` field. At
        # least one of these two fields must be provided. The requirements and behavior of the verification are
        # determined by the `template_id` provided. If `user_id` is provided, there must be an associated user;
        # otherwise, an error will be returned.
        #
        #
        # If you don't know whether an active Identity Verification exists for a given `client_user_id` and/or
        # `user_id`, you can specify `"is_idempotent": true` in the request body. With idempotency enabled, a new
        # Identity Verification will only be created if one does not already exist for the associated `client_user_id`
        # and/or `user_id`, and `template_id`. If an Identity Verification is found, it will be returned unmodified with
        # a `200 OK` HTTP status code.
        #
        #
        # If `user_id` is not provided, you can also use this endpoint to supply information you already have collected
        # about the user; if any of these fields are specified, the screens prompting the user to enter them will be
        # skipped during the Link flow. If `user_id` is provided, user information can not be included in the request
        # body. Please use the `/user/update` endpoint to update user data instead.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Identity::Verification::Types::IdentityVerificationCreateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.identity.verification.create(
        #     is_shareable: true,
        #     template_id: "idvtmp_4FrXJvfQU3zGUR",
        #     gave_consent: true
        #   )
        #
        # @return [Plaid::Types::IdentityVerificationCreateResponse]
        def create(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "identity_verification/create",
            body: Plaid::Identity::Verification::Types::IdentityVerificationCreateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::IdentityVerificationCreateResponse.load(response.body))
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

        # Retrieve a previously created Identity Verification.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Identity::Verification::Types::IdentityVerificationGetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.identity.verification.get(identity_verification_id: "idv_52xR9LKo77r1Np")
        #
        # @return [Plaid::Types::IdentityVerificationGetResponse]
        def get(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "identity_verification/get",
            body: Plaid::Identity::Verification::Types::IdentityVerificationGetRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::IdentityVerificationGetResponse.load(response.body))
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

        # Filter and list Identity Verifications created by your account
        #
        # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::IdentityVerification` in the
        # `identity_verifications` field of every page, requesting pages as they are needed. Call `pages` on it to get
        # each page as a `Plaid::Types::IdentityVerificationListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Identity::Verification::Types::IdentityVerificationListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.identity.verification.list(template_id: "idvtmp_4FrXJvfQU3zGUR")
        #
        # @return [Plaid::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::CursorItemIterator.new(
            cursor_field: :next_cursor,
            item_field: :identity_verifications,
            initial_cursor: params[:cursor]
          ) do |next_cursor|
            params[:cursor] = next_cursor
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "identity_verification/list",
              body: Plaid::Identity::Verification::Types::IdentityVerificationListRequest.new(params).to_h,
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
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::IdentityVerificationListResponse.load(response.body))
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

        # Allow a customer to retry their Identity Verification
        #
        # @param request_options [Hash]
        # @param params [Plaid::Identity::Verification::Types::IdentityVerificationRetryRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.identity.verification.retry_(
        #     client_user_id: "your-db-id-3b24110",
        #     template_id: "idvtmp_4FrXJvfQU3zGUR",
        #     strategy: "reset"
        #   )
        #
        # @return [Plaid::Types::IdentityVerificationRetryResponse]
        def retry_(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "identity_verification/retry",
            body: Plaid::Identity::Verification::Types::IdentityVerificationRetryRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::IdentityVerificationRetryResponse.load(response.body))
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

        # Try to autofill an Identity Verification based on the provided phone number, date of birth and country of
        # residence.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Identity::Verification::Types::IdentityVerificationAutofillCreateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.identity.verification.create_autofill(identity_verification_id: "flwses_42cF1MNo42r9Xj")
        #
        # @return [Plaid::Types::IdentityVerificationAutofillCreateResponse]
        def create_autofill(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "identity_verification/autofill/create",
            body: Plaid::Identity::Verification::Types::IdentityVerificationAutofillCreateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::IdentityVerificationAutofillCreateResponse.load(response.body))
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
end
