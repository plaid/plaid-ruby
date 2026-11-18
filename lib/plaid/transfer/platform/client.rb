# frozen_string_literal: true

module Plaid
  module Transfer
    module Platform
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/transfer/platform/requirement/submit` endpoint to submit additional onboarding information that is
        # needed by Plaid to approve or decline the originator. See [Requirement type schema
        # documentation](https://docs.google.com/document/d/1NEQkTD0sVK50iAQi6xHigrexDUxZ4QxXqSEfV_FFTiU/) for a list of
        # requirement types and possible values.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Platform::Types::TransferPlatformRequirementSubmitRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.platform.submit_requirement(
        #     originator_client_id: "originator_client_id",
        #     requirement_submissions: [{
        #       requirement_type: "requirement_type",
        #       value: "value"
        #     }]
        #   )
        #
        # @return [Plaid::Types::TransferPlatformRequirementSubmitResponse]
        def submit_requirement(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/platform/requirement/submit",
            body: Plaid::Transfer::Platform::Types::TransferPlatformRequirementSubmitRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferPlatformRequirementSubmitResponse.load(response.body))
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

        # Use the `/transfer/platform/originator/create` endpoint to submit information about the originator you are
        # onboarding, including the originator's agreement to the required legal terms.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Platform::Types::TransferPlatformOriginatorCreateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.platform.create_originator(
        #     originator_client_id: "originator_client_id",
        #     tos_acceptance_metadata: {
        #       agreement_accepted: true,
        #       originator_ip_address: "originator_ip_address",
        #       agreement_accepted_at: "2024-01-15T09:30:00Z"
        #     },
        #     originator_reviewed_at: "2024-01-15T09:30:00Z"
        #   )
        #
        # @return [Plaid::Types::TransferPlatformOriginatorCreateResponse]
        def create_originator(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/platform/originator/create",
            body: Plaid::Transfer::Platform::Types::TransferPlatformOriginatorCreateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferPlatformOriginatorCreateResponse.load(response.body))
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

        # Use the `/transfer/platform/person/create` endpoint to create a person associated with an originator (e.g.
        # beneficial owner or control person) and optionally submit personal identification information for them.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Platform::Types::TransferPlatformPersonCreateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.platform.create_person(originator_client_id: "originator_client_id")
        #
        # @return [Plaid::Types::TransferPlatformPersonCreateResponse]
        def create_person(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/platform/person/create",
            body: Plaid::Transfer::Platform::Types::TransferPlatformPersonCreateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferPlatformPersonCreateResponse.load(response.body))
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
