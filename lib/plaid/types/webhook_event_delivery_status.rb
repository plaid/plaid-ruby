# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WebhookEventDeliveryStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "PENDING"
      DELIVERED = "DELIVERED"
      FAILED = "FAILED"
    end
  end
end
