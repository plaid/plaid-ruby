# frozen_string_literal: true

module Plaid
  module Transfer
    module Diligence
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/transfer/diligence/submit` endpoint to submit transfer diligence on behalf of the originator (i.e.,
        # the end customer).
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Diligence::Types::TransferDiligenceSubmitRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.diligence.submit(
        #     originator_client_id: "originator_client_id",
        #     originator_diligence: {
        #       dba: "dba",
        #       tax_id: "tax_id",
        #       address: {
        #         city: "city",
        #         street: "street",
        #         region: "region",
        #         postal_code: "postal_code",
        #         country_code: "country_code"
        #       },
        #       website: "website",
        #       naics_code: "naics_code",
        #       funding_account: {
        #         access_token: "access_token",
        #         account_id: "account_id"
        #       }
        #     }
        #   )
        #
        # @return [Plaid::Types::TransferDiligenceSubmitResponse]
        def submit(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/diligence/submit",
            body: Plaid::Transfer::Diligence::Types::TransferDiligenceSubmitRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferDiligenceSubmitResponse.load(response.body))
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

        # Third-party sender customers can use the `/transfer/diligence/document/upload` endpoint to upload a document
        # on behalf of their end customer (i.e. originator) to Plaid. You'll need to send a request of type
        # `multipart/form-data`.
        # You must provide the `client_id` in the `PLAID-CLIENT-ID` header and `secret` in the `PLAID-SECRET` header.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.diligence.upload_document(
        #     originator_client_id: "originator_client_id",
        #     file: "/path/to/your/file",
        #     purpose: "DUE_DILIGENCE"
        #   )
        #
        # @return [Plaid::Types::TransferDiligenceDocumentUploadResponse]
        def upload_document(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          unless params[:originator_client_id].nil?
            body.add(
              name: "originator_client_id",
              value: params[:originator_client_id]
            )
          end
          if params[:file]
            body.add_file(
              name: "file",
              file: params[:file]
            )
          end
          unless params[:purpose].nil?
            body.add(
              name: "purpose",
              value: params[:purpose]
            )
          end

          request = Plaid::Internal::Multipart::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/diligence/document/upload",
            body: body,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferDiligenceDocumentUploadResponse.load(response.body))
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
