# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Create a payment recipient for payment initiation.  The recipient must be in Europe, within a country that is a
      # member of the Single Euro Payments Area (SEPA) or a non-Eurozone country
      # [supported](https://support.plaid.com/hc/en-us/articles/27895826947735-What-Plaid-products-are-supported-in-each-country-and-region)
      # by Plaid. For a standing order (recurring) payment, the recipient must be in the UK.
      #
      # It is recommended to use `bacs` in the UK and `iban` in EU.
      #
      # The endpoint is idempotent: if a developer has already made a request with the same payment details, Plaid will
      # return the same `recipient_id`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationRecipientCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.create_recipient(name: "name")
      #
      # @return [Plaid::Types::PaymentInitiationRecipientCreateResponse]
      def create_recipient(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/recipient/create",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationRecipientCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationRecipientCreateResponse.load(response.body))
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

      # Reverse a settled payment from a Plaid virtual account.
      #
      # The original payment must be in a settled state to be refunded.
      # To refund partially, specify the amount as part of the request.
      # If the amount is not specified, the refund amount will be equal to all
      # of the remaining payment amount that has not been refunded yet.
      #
      # The refund will go back to the source account that initiated the payment.
      # The original payment must have been initiated to a Plaid virtual account
      # so that this account can be used to initiate the refund.
      #
      # Providing counterparty information such as date of birth and address increases
      # the likelihood of refund being successful without human intervention.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationPaymentReverseRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.reverse_payment(
      #     payment_id: "payment_id",
      #     idempotency_key: "idempotency_key",
      #     reference: "reference"
      #   )
      #
      # @return [Plaid::Types::PaymentInitiationPaymentReverseResponse]
      def reverse_payment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/payment/reverse",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationPaymentReverseRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationPaymentReverseResponse.load(response.body))
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

      # Get details about a payment recipient you have previously created.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationRecipientGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.get_recipient(recipient_id: "recipient_id")
      #
      # @return [Plaid::Types::PaymentInitiationRecipientGetResponse]
      def get_recipient(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/recipient/get",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationRecipientGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationRecipientGetResponse.load(response.body))
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

      # The `/payment_initiation/recipient/list` endpoint lists the payment recipients that you have previously created.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::PaymentInitiationRecipient` in
      # the `recipients` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
      # as a `Plaid::Types::PaymentInitiationRecipientListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationRecipientListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.list_recipients
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_recipients(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :recipients,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "payment_initiation/recipient/list",
            body: Plaid::PaymentInitiation::Types::PaymentInitiationRecipientListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationRecipientListResponse.load(response.body))
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

      # After creating a payment recipient, you can use the `/payment_initiation/payment/create` endpoint to create a
      # payment to that recipient.  Payments can be one-time or standing order (recurring) and can be denominated in
      # EUR, GBP, or another chosen
      # [currency](https://plaid.com/docs/api/products/payment-initiation/#payment_initiation-payment-create-request-amount-currency).
      # If making domestic GBP-denominated payments, your recipient must have been created with Bacs numbers. In
      # general, EUR-denominated payments will be sent via SEPA Credit Transfer, GBP-denominated payments will be sent
      # via the Faster Payments network and for non-Eurozone markets typically via the local payment scheme, but the
      # payment network used will be determined by the institution. Payments sent via Faster Payments will typically
      # arrive immediately, while payments sent via SEPA Credit Transfer or other local payment schemes will typically
      # arrive in one business day.
      #
      # Standing orders (recurring payments) must be denominated in GBP and can only be sent to recipients in the UK.
      # Once created, standing order payments cannot be modified or canceled via the API. An end user can cancel or
      # modify a standing order directly on their banking application or website, or by contacting the bank. Standing
      # orders will follow the payment rules of the underlying rails (Faster Payments in UK). Payments can be sent
      # Monday to Friday, excluding bank holidays. If the pre-arranged date falls on a weekend or bank holiday, the
      # payment is made on the next working day. It is not possible to guarantee the exact time the payment will reach
      # the recipient's account, although at least 90% of standing order payments are sent by 6am.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationPaymentCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.create_payment(
      #     recipient_id: "recipient_id",
      #     reference: "reference",
      #     amount: {
      #       currency: "GBP",
      #       value: 1.1
      #     }
      #   )
      #
      # @return [Plaid::Types::PaymentInitiationPaymentCreateResponse]
      def create_payment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/payment/create",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationPaymentCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationPaymentCreateResponse.load(response.body))
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

      # The `/payment_initiation/payment/token/create` endpoint has been deprecated. New Plaid customers will be unable
      # to use this endpoint, and existing customers are encouraged to migrate to the newer, `link_token`-based flow.
      # The recommended flow is to provide the `payment_id` to `/link/token/create`, which returns a `link_token` used
      # to initialize Link.
      #
      # The `/payment_initiation/payment/token/create` endpoint is used to create a `payment_token`, which can then be
      # used in Link initialization to enter a payment initiation flow. You can only use a `payment_token` once. If this
      # attempt fails, the end user aborts the flow, or the token expires, you will need to create a new payment token.
      # Creating a new payment token does not require end user input.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationPaymentTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.create_payment_token(payment_id: "payment_id")
      #
      # @return [Plaid::Types::PaymentInitiationPaymentTokenCreateResponse]
      def create_payment_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/payment/token/create",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationPaymentTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationPaymentTokenCreateResponse.load(response.body))
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

      # The `/payment_initiation/consent/create` endpoint is used to create a payment consent, which can be used to
      # initiate payments on behalf of the user. Payment consents are created with `UNAUTHORISED` status by default and
      # must be authorised by the user before payments can be initiated.
      #
      # Consents can be limited in time and scope, and have constraints that describe limitations for payments.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationConsentCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.create_consent(
      #     recipient_id: "recipient_id",
      #     reference: "reference",
      #     constraints: {
      #       max_payment_amount: {
      #         currency: "GBP",
      #         value: 1.1
      #       },
      #       periodic_amounts: [{
      #         amount: {
      #           currency: "GBP",
      #           value: 1.1
      #         },
      #         interval: "DAY",
      #         alignment: "CALENDAR"
      #       }]
      #     }
      #   )
      #
      # @return [Plaid::Types::PaymentInitiationConsentCreateResponse]
      def create_consent(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/consent/create",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationConsentCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationConsentCreateResponse.load(response.body))
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

      # The `/payment_initiation/consent/get` endpoint can be used to check the status of a payment consent, as well as
      # to receive basic information such as recipient and constraints.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationConsentGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.get_consent(consent_id: "consent_id")
      #
      # @return [Plaid::Types::PaymentInitiationConsentGetResponse]
      def get_consent(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/consent/get",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationConsentGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationConsentGetResponse.load(response.body))
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

      # The `/payment_initiation/consent/revoke` endpoint can be used to revoke the payment consent. Once the consent is
      # revoked, it is not possible to initiate payments using it.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationConsentRevokeRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.revoke_consent(consent_id: "consent_id")
      #
      # @return [Plaid::Types::PaymentInitiationConsentRevokeResponse]
      def revoke_consent(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/consent/revoke",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationConsentRevokeRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationConsentRevokeResponse.load(response.body))
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

      # The `/payment_initiation/consent/payment/execute` endpoint can be used to execute payments using payment
      # consent.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationConsentPaymentExecuteRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.execute_consent_payment(
      #     consent_id: "consent_id",
      #     amount: {
      #       currency: "GBP",
      #       value: 1.1
      #     },
      #     idempotency_key: "idempotency_key"
      #   )
      #
      # @return [Plaid::Types::PaymentInitiationConsentPaymentExecuteResponse]
      def execute_consent_payment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/consent/payment/execute",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationConsentPaymentExecuteRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationConsentPaymentExecuteResponse.load(response.body))
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

      # The `/payment_initiation/payment/get` endpoint can be used to check the status of a payment, as well as to
      # receive basic information such as recipient and payment amount. In the case of standing orders, the
      # `/payment_initiation/payment/get` endpoint will provide information about the status of the overall standing
      # order itself; the API cannot be used to retrieve payment status for individual payments within a standing order.
      #
      # Polling for status updates in Production is highly discouraged. Repeatedly calling
      # `/payment_initiation/payment/get` to check a payment's status is unreliable and may trigger API rate limits.
      # Only the `PAYMENT_STATUS_UPDATE` webhook should be used to receive real-time status updates in Production.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationPaymentGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.get_payment(payment_id: "payment_id")
      #
      # @return [Plaid::Types::PaymentInitiationPaymentGetResponse]
      def get_payment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "payment_initiation/payment/get",
          body: Plaid::PaymentInitiation::Types::PaymentInitiationPaymentGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationPaymentGetResponse.load(response.body))
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

      # The `/payment_initiation/payment/list` endpoint can be used to retrieve all created payments. By default, the 10
      # most recent payments are returned. You can request more payments and paginate through the results using the
      # optional `count` and `cursor` parameters.
      #
      # Returns a `Plaid::Internal::CursorItemIterator` that yields each `Plaid::Types::PaymentInitiationPayment` in the
      # `payments` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Plaid::Types::PaymentInitiationPaymentListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::PaymentInitiation::Types::PaymentInitiationPaymentListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.payment_initiation.list_payments
      #
      # @return [Plaid::Internal::CursorItemIterator]
      def list_payments(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::CursorItemIterator.new(
          cursor_field: :next_cursor,
          item_field: :payments,
          initial_cursor: params[:cursor]
        ) do |next_cursor|
          params[:cursor] = next_cursor
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "payment_initiation/payment/list",
            body: Plaid::PaymentInitiation::Types::PaymentInitiationPaymentListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::PaymentInitiationPaymentListResponse.load(response.body))
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
    end
  end
end
