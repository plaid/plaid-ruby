# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Asset information about an account
    class AccountAssets < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :balances, -> { Plaid::Types::AssetReportAccountBalance }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :verification_status, -> { Plaid::Types::AccountAssetsVerificationStatus }, optional: true, nullable: false

      field :persistent_account_id, -> { String }, optional: true, nullable: false

      field :days_available, -> { Float }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::AssetReportTransaction] }, optional: false, nullable: false

      field :investments, -> { Plaid::Types::AssetReportInvestments }, optional: true, nullable: true

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false

      field :ownership_type, -> { Plaid::Types::OwnershipType }, optional: true, nullable: true

      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::HistoricalBalance] }, optional: false, nullable: false

      field :account_insights, -> { Plaid::Types::AccountInsights }, optional: true, nullable: true
    end
  end
end
