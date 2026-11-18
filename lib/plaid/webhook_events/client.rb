# frozen_string_literal: true

module Plaid
  module WebhookEvents
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # `/beta/webhook_events/list` returns the webhooks Plaid sent to your account in the last 7 days, including
      # webhooks that weren't delivered. Use it to recover webhooks your endpoint missed. Events are returned oldest
      # first.
      #
      # `TRANSACTIONS` webhooks are not included. To recover Transactions updates, use
      # [`/transactions/sync`](https://plaid.com/docs/api/products/transactions/#transactionssync).
      #
      # To page through events, omit `cursor` on your first request, then pass the previous response's `next_cursor` on
      # each later request. Store `next_cursor` even when `has_more` is `false`, so your next poll returns only newer
      # events.
      #
      # Filters are optional. An event matches a filter if it matches any of the filter's values, and must match every
      # filter you provide.
      #
      # Events older than 7 days are not retained. If your cursor or `start_time` is older than that, the request fails
      # with `WEBHOOK_EVENTS_CURSOR_EXPIRED` or `WEBHOOK_EVENTS_START_TIME_OUT_OF_RANGE`.
      #
      # This endpoint is in beta and may change in backwards-incompatible ways. Send feedback to building@plaid.com.
      #
      # @param request_options [Hash]
      # @param params [Plaid::WebhookEvents::Types::BetaWebhookEventsListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.webhook_events.list(count: 100)
      #
      # @return [Plaid::Types::BetaWebhookEventsListResponse]
      def list(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/webhook_events/list",
          body: Plaid::WebhookEvents::Types::BetaWebhookEventsListRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaWebhookEventsListResponse.load(response.body))
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
