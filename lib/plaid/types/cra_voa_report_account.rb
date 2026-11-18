# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # VOA Report information about an account.
    class CraVoaReportAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :balances, -> { Plaid::Types::CraVoaReportAccountBalances }, optional: false, nullable: false

      field :consumer_disputes, -> { Internal::Types::Array[Plaid::Types::ConsumerDispute] }, optional: false, nullable: false

      field :mask, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :days_available, -> { Float }, optional: false, nullable: false

      field :transactions_insights, -> { Plaid::Types::CraVoaReportTransactionsInsights }, optional: false, nullable: false

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false

      field :ownership_type, -> { Plaid::Types::OwnershipType }, optional: false, nullable: true

      field :investments, -> { Plaid::Types::BaseReportInvestments }, optional: true, nullable: true
    end
  end
end
