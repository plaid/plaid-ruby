# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetTransactionType
      extend Plaid::Internal::Types::Enum

      CREDIT = "Credit"
      DEBIT = "Debit"
    end
  end
end
