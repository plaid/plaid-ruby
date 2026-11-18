# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The account number and sort code of the counterparty's account. The account number must be exactly 8 characters.
    class WalletTransactionCounterpartyBacs < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false

      field :sort_code, -> { String }, optional: true, nullable: false
    end
  end
end
