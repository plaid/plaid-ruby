# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PendingDisconnectWebhookReason
      extend Plaid::Internal::Types::Enum

      INSTITUTION_MIGRATION = "INSTITUTION_MIGRATION"
      INSTITUTION_TOKEN_EXPIRATION = "INSTITUTION_TOKEN_EXPIRATION"
    end
  end
end
