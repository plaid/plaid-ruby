# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkDeliveryWebhookDeliveryStatus
      extend Plaid::Internal::Types::Enum

      SUCCESS = "SUCCESS"
      FAILURE = "FAILURE"
    end
  end
end
