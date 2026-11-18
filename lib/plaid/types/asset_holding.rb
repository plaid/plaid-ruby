# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class AssetHolding < Internal::Types::Model
      field :asset_holding_id, -> { String }, optional: false, nullable: true, api_name: "AssetHoldingID"

      field :currency, -> { String }, optional: false, nullable: true, api_name: "Currency"

      field :asset_holding_description, -> { String }, optional: false, nullable: true, api_name: "AssetHoldingDescription"

      field :asset_holding_symbol, -> { String }, optional: false, nullable: true, api_name: "AssetHoldingSymbol"

      field :asset_holding_security_name, -> { String }, optional: false, nullable: true, api_name: "AssetHoldingSecurityName"

      field :asset_holding_units, -> { Float }, optional: false, nullable: true, api_name: "AssetHoldingUnits"

      field :asset_holding_market_value_amount, -> { Float }, optional: false, nullable: true, api_name: "AssetHoldingMarketValueAmount"

      field :asset_holding_current_price_amount, -> { Float }, optional: false, nullable: true, api_name: "AssetHoldingCurrentPriceAmount"

      field :asset_holding_type, -> { Plaid::Types::AssetHoldingAssetHoldingType }, optional: false, nullable: true, api_name: "AssetHoldingType"

      field :asset_holding_restricted_indicator, -> { Plaid::Types::AssetHoldingAssetHoldingRestrictedIndicator }, optional: false, nullable: true, api_name: "AssetHoldingRestrictedIndicator"

      field :asset_holding_vested_amount, -> { Float }, optional: false, nullable: true, api_name: "AssetHoldingVestedAmount"
    end
  end
end
