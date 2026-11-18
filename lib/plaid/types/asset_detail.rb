# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about an asset. In CRA reports, holdings-derived balances, `AssetRetirementIndicator`, and
    # `AssetEmployerSponsoredIndicator` may be omitted when recent investment data was unavailable at report generation.
    # The account's current and available balances remain included.
    class AssetDetail < Internal::Types::Model
      field :asset_unique_identifier, -> { String }, optional: false, nullable: false, api_name: "AssetUniqueIdentifier"

      field :asset_account_identifier, -> { String }, optional: false, nullable: false, api_name: "AssetAccountIdentifier"

      field :asset_as_of_date, -> { String }, optional: false, nullable: false, api_name: "AssetAsOfDate"

      field :asset_description, -> { String }, optional: false, nullable: true, api_name: "AssetDescription"

      field :asset_available_balance_amount, -> { Float }, optional: false, nullable: false, api_name: "AssetAvailableBalanceAmount"

      field :asset_current_balance_amount, -> { Float }, optional: false, nullable: false, api_name: "AssetCurrentBalanceAmount"

      field :asset_holding_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetHoldingBalanceAmount"

      field :asset_holding_balance_net_margin_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetHoldingBalanceNetMarginAmount"

      field :asset_bonds_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetBondsBalanceAmount"

      field :asset_stocks_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetStocksBalanceAmount"

      field :asset_crypto_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetCryptoBalanceAmount"

      field :asset_other_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetOtherBalanceAmount"

      field :asset_margin_amount_balance, -> { Float }, optional: true, nullable: true, api_name: "AssetMarginAmountBalance"

      field :asset_available_cash_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetAvailableCashBalanceAmount"

      field :asset_cash_balance_amount, -> { Float }, optional: true, nullable: true, api_name: "AssetCashBalanceAmount"

      field :asset_type, -> { Plaid::Types::AssetType }, optional: false, nullable: false, api_name: "AssetType"

      field :asset_type_additional_description, -> { String }, optional: false, nullable: true, api_name: "AssetTypeAdditionalDescription"

      field :asset_days_requested_count, -> { Integer }, optional: false, nullable: false, api_name: "AssetDaysRequestedCount"

      field :asset_ownership_type, -> { String }, optional: false, nullable: true, api_name: "AssetOwnershipType"

      field :asset_retirement_indicator, -> { Plaid::Types::AssetDetailAssetRetirementIndicator }, optional: true, nullable: true, api_name: "AssetRetirementIndicator"

      field :asset_employer_sponsored_indicator, -> { Plaid::Types::AssetDetailAssetEmployerSponsoredIndicator }, optional: true, nullable: true, api_name: "AssetEmployerSponsoredIndicator"
    end
  end
end
