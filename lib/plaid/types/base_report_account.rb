# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Base Report information about an account
    class BaseReportAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :balances, -> { Plaid::Types::BaseReportAccountBalances }, optional: false, nullable: false

      field :consumer_disputes, -> { Internal::Types::Array[Plaid::Types::ConsumerDispute] }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :metadata, -> { Plaid::Types::BaseReportAccountMetadata }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :days_available, -> { Float }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::BaseReportTransaction] }, optional: false, nullable: false

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false

      field :holder_category, -> { Plaid::Types::BaseReportAccountHolderCategory }, optional: false, nullable: true

      field :ownership_type, -> { Plaid::Types::OwnershipType }, optional: false, nullable: true

      field :investments, -> { Plaid::Types::BaseReportInvestments }, optional: true, nullable: true

      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::BaseReportHistoricalBalance] }, optional: true, nullable: false

      field :account_insights, -> { Plaid::Types::BaseReportAccountInsights }, optional: true, nullable: false

      field :attributes, -> { Plaid::Types::BaseReportAttributes }, optional: true, nullable: false
    end
  end
end
