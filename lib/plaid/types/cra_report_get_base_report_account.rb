# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account included in a Base Report returned by `/cra/report/get`.
    class CraReportGetBaseReportAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :mask, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :days_available, -> { Integer }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::BaseReportAccountMetadata }, optional: false, nullable: false

      field :balances, -> { Plaid::Types::CraReportGetBaseReportAccountBalances }, optional: false, nullable: false

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false

      field :ownership_type, -> { Plaid::Types::OwnershipType }, optional: false, nullable: true

      field :consumer_disputes, -> { Internal::Types::Array[Plaid::Types::ConsumerDispute] }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CraReportGetBaseReportTransaction] }, optional: false, nullable: false

      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::BaseReportHistoricalBalance] }, optional: true, nullable: false

      field :account_insights, -> { Plaid::Types::CraReportGetBaseReportAccountInsights }, optional: true, nullable: true

      field :attributes, -> { Plaid::Types::CraReportGetBaseReportAccountAttributes }, optional: false, nullable: true

      field :identity_match, -> { Plaid::Types::CraReportGetBaseReportAccountIdentityMatch }, optional: true, nullable: true

      field :holder_category, -> { Plaid::Types::CraReportGetBaseReportAccountHolderCategory }, optional: false, nullable: true

      field :investments, -> { Plaid::Types::BaseReportInvestments }, optional: true, nullable: true
    end
  end
end
