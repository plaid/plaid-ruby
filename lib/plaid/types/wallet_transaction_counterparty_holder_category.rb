# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletTransactionCounterpartyHolderCategory
      extend Plaid::Internal::Types::Enum

      PERSONAL = "personal"
      BUSINESS = "business"
    end
  end
end
