# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkDeliveryWebhookCommunicationMethod
      extend Plaid::Internal::Types::Enum

      SMS = "SMS"
      EMAIL = "EMAIL"
    end
  end
end
