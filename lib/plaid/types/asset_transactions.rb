# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetTransactions < Internal::Types::Model
      field :asset_transaction, -> { Internal::Types::Array[Plaid::Types::AssetTransaction] }, optional: false, nullable: false, api_name: "ASSET_TRANSACTION"
    end
  end
end
