# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkDeliveryWebhookCallbackType
      extend Plaid::Internal::Types::Enum

      ON_SUCCESS = "ON_SUCCESS"
      ON_EVENT = "ON_EVENT"
      ON_EXIT = "ON_EXIT"
    end
  end
end
