# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing...
    class CreditFreddieMacAssetTransaction < Internal::Types::Model
      field :asset_transaction_detail, -> { Plaid::Types::AssetTransactionDetail }, optional: false, nullable: false, api_name: "ASSET_TRANSACTION_DETAIL"

      field :asset_transaction_description, -> { Internal::Types::Array[Plaid::Types::AssetTransactionDescription] }, optional: false, nullable: false, api_name: "ASSET_TRANSACTION_DESCRIPTION"
    end
  end
end
