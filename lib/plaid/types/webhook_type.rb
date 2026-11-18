# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WebhookType
      extend Plaid::Internal::Types::Enum

      AUTH = "AUTH"
      HOLDINGS = "HOLDINGS"
      INVESTMENTS_TRANSACTIONS = "INVESTMENTS_TRANSACTIONS"
      ITEM = "ITEM"
      LIABILITIES = "LIABILITIES"
      TRANSACTIONS = "TRANSACTIONS"
      ASSETS = "ASSETS"
      IDENTITY = "IDENTITY"
    end
  end
end
