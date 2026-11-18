# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetHoldings < Internal::Types::Model
      field :asset_holding, -> { Internal::Types::Array[Plaid::Types::AssetHolding] }, optional: false, nullable: false, api_name: "ASSET_HOLDING"
    end
  end
end
