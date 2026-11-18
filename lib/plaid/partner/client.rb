# frozen_string_literal: true

module Plaid
  module Partner
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/partner/customer/create` endpoint is used by reseller partners to create end customers. To create end
      # customers, it should be called in the Production environment only, even when creating Sandbox API keys. If
      # called in the Sandbox environment, it will return a sample response, but no customer will be created and the API
      # keys will not be valid.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::PartnerCustomerCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.create_customer(
      #     company_name: "Plaid",
      #     is_diligence_attested: true,
      #     products: %w[auth identity],
      #     create_link_customization: true,
      #     legal_entity_name: "Plaid",
      #     website: "plaid.com",
      #     application_name: "Plaid",
      #     technical_contact: {
      #       given_name: "Alice",
      #       family_name: "Smith",
      #       email: "alice.smith@example.com"
      #     },
      #     billing_contact: {
      #       given_name: "Bob",
      #       family_name: "Jones",
      #       email: "bob.jones@example.com"
      #     },
      #     customer_support_info: {
      #       email: "support@example.com",
      #       phone_number: "1234567890",
      #       contact_url: "example.com/contact",
      #       link_update_url: "example.com/update"
      #     },
      #     address: {
      #       city: "New York",
      #       street: "123 Main St",
      #       region: "NY",
      #       postal_code: "12345",
      #       country_code: "US"
      #     },
      #     is_bank_addendum_completed: true,
      #     redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html]
      #   )
      #
      # @return [Plaid::Types::PartnerCustomerCreateResponse]
      def create_customer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "partner/customer/create",
          body: Plaid::Partner::Types::PartnerCustomerCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PartnerCustomerCreateResponse.load(response.body))
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

      # The `/partner/customer/get` endpoint is used by reseller partners to retrieve data about a single end customer.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::PartnerCustomerGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.get_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
      #
      # @return [Plaid::Types::PartnerCustomerGetResponse]
      def get_customer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "partner/customer/get",
          body: Plaid::Partner::Types::PartnerCustomerGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PartnerCustomerGetResponse.load(response.body))
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

      # The `/partner/customer/enable` endpoint is used by reseller partners to enable an end customer in the full
      # Production environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::PartnerCustomerEnableRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.enable_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
      #
      # @return [Plaid::Types::PartnerCustomerEnableResponse]
      def enable_customer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "partner/customer/enable",
          body: Plaid::Partner::Types::PartnerCustomerEnableRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PartnerCustomerEnableResponse.load(response.body))
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

      # The `/partner/customer/remove` endpoint is used by reseller partners to remove an end customer. Removing an end
      # customer will remove it from view in the Plaid Dashboard and deactivate its API keys. This endpoint can only be
      # used to remove an end customer that has not yet been enabled in full Production.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::PartnerCustomerRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.remove_customer(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
      #
      # @return [Plaid::Types::PartnerCustomerRemoveResponse]
      def remove_customer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "partner/customer/remove",
          body: Plaid::Partner::Types::PartnerCustomerRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PartnerCustomerRemoveResponse.load(response.body))
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

      # The `/partner/customer/oauth_institutions/get` endpoint is used by reseller partners to retrieve
      # OAuth-institution registration information about a single end customer. To learn how to set up a webhook to
      # listen to status update events, visit the [reseller
      # documentation](https://plaid.com/docs/account/resellers/#enabling-end-customers).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::PartnerCustomerOAuthInstitutionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.get_customer_oauth_institutions(end_customer_client_id: "7f57eb3d2a9j6480121fx361")
      #
      # @return [Plaid::Types::PartnerCustomerOAuthInstitutionsGetResponse]
      def get_customer_oauth_institutions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "partner/customer/oauth_institutions/get",
          body: Plaid::Partner::Types::PartnerCustomerOAuthInstitutionsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PartnerCustomerOAuthInstitutionsGetResponse.load(response.body))
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

      # The `/beta/partner/customer/v1/create` endpoint creates a new end customer record. You can provide as much
      # information as you have available. If any required information is missing for the products you intend to use, it
      # will be listed in the `requirements_due` field of the response.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::BetaPartnerCustomerV1CreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.create_customer_v1(
      #     company_name: "Plaid",
      #     products: %w[auth identity],
      #     create_link_customization: true,
      #     legal_entity_name: "Plaid",
      #     website: "plaid.com",
      #     application_name: "Plaid",
      #     technical_contact: {
      #       given_name: "Alice",
      #       family_name: "Smith",
      #       email: "alice.smith@example.com"
      #     },
      #     billing_contact: {
      #       given_name: "Bob",
      #       family_name: "Jones",
      #       email: "bob.jones@example.com"
      #     },
      #     customer_support_info: {
      #       email: "support@example.com",
      #       phone_number: "1234567890",
      #       contact_url: "example.com/contact",
      #       link_update_url: "example.com/update"
      #     },
      #     address: {
      #       city: "New York",
      #       street: "123 Main St",
      #       region: "NY",
      #       postal_code: "12345",
      #       country_code: "US"
      #     },
      #     redirect_uris: %w[http://localhost/oauth.html https://www.example.com/oauth.html]
      #   )
      #
      # @return [Plaid::Types::BetaPartnerCustomerV1CreateResponse]
      def create_customer_v1(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/partner/customer/v1/create",
          body: Plaid::Partner::Types::BetaPartnerCustomerV1CreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaPartnerCustomerV1CreateResponse.load(response.body))
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

      # The `/beta/partner/customer/v1/get` endpoint is used by reseller partners to retrieve data about a single end
      # customer.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::BetaPartnerCustomerV1GetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.get_customer_v1(end_customer_client_id: "634758733ebb4f00134b85ea")
      #
      # @return [Plaid::Types::BetaPartnerCustomerV1GetResponse]
      def get_customer_v1(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/partner/customer/v1/get",
          body: Plaid::Partner::Types::BetaPartnerCustomerV1GetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaPartnerCustomerV1GetResponse.load(response.body))
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

      # The `/beta/partner/customer/v1/update` endpoint updates an existing end customer record.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::BetaPartnerCustomerV1UpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.update_customer_v1(
      #     end_customer_client_id: "634758733ebb4f00134b85ea",
      #     bank_addendum_acceptance: {
      #       customer_accepted: true,
      #       customer_ip_address: "127.0.0.1",
      #       customer_agreement_timestamp: "2025-01-01T01:00:00Z"
      #     },
      #     questionnaires: {
      #       cra: {
      #         purposes: {
      #           WRITTEN_INSTRUCTION: {
      #             use_cases: %w[CREDIT_UNDERWRITING TENANT_SCREENING]
      #           }
      #         },
      #         is_third_party_involved: true,
      #         is_technical_service_provider_involved: true
      #       }
      #     }
      #   )
      #
      # @return [Plaid::Types::BetaPartnerCustomerV1UpdateResponse]
      def update_customer_v1(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/partner/customer/v1/update",
          body: Plaid::Partner::Types::BetaPartnerCustomerV1UpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaPartnerCustomerV1UpdateResponse.load(response.body))
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

      # The `/beta/partner/customer/v1/enable` endpoint is used by reseller partners to enable an end customer in the
      # full Production environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Partner::Types::BetaPartnerCustomerV1EnableRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.partner.enable_customer_v1(
      #     end_customer_client_id: "634758733ebb4f00134b85ea",
      #     products: ["auth"]
      #   )
      #
      # @return [Plaid::Types::BetaPartnerCustomerV1EnableResponse]
      def enable_customer_v1(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/partner/customer/v1/enable",
          body: Plaid::Partner::Types::BetaPartnerCustomerV1EnableRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaPartnerCustomerV1EnableResponse.load(response.body))
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

      # @return [Plaid::Insights::Client]
      def insights
        @insights ||= Plaid::Partner::Insights::Client.new(client: @client)
      end
    end
  end
end
