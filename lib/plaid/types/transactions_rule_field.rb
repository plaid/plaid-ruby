# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransactionsRuleField
      extend Plaid::Internal::Types::Enum

      TRANSACTION_ID = "TRANSACTION_ID"
      MERCHANT_NAME = "MERCHANT_NAME"
    end
  end
end
