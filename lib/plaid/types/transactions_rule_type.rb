# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransactionsRuleType
      extend Plaid::Internal::Types::Enum

      EXACT_MATCH = "EXACT_MATCH"
      SUBSTRING_MATCH = "SUBSTRING_MATCH"
    end
  end
end
