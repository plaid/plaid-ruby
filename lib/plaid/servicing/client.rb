# frozen_string_literal: true

module Plaid
  module Servicing
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Plaid::Subscription::Client]
      def subscription
        @subscription ||= Plaid::Servicing::Subscription::Client.new(client: @client)
      end
    end
  end
end
