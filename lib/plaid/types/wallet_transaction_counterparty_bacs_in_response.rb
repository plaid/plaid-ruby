# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The account number and sort code of the counterparty's account.
    class WalletTransactionCounterpartyBacsInResponse < Internal::Types::Model
      field :account, -> { String }, optional: false, nullable: false

      field :sort_code, -> { String }, optional: false, nullable: false
    end
  end
end
