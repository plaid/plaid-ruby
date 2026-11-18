# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account data included in a Home Lending VOA report. Fields not supported by the selected report format are
    # omitted.
    class CraReportGetHomeLendingVoaAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :balances, -> { Plaid::Types::CraReportGetHomeLendingVoaAccountBalances }, optional: true, nullable: true

      field :mask, -> { String }, optional: true, nullable: true

      field :days_available, -> { Integer }, optional: true, nullable: true

      field :metadata, -> { Plaid::Types::CraReportGetHomeLendingVoaAccountMetadata }, optional: true, nullable: true

      field :owners, -> { Internal::Types::Array[Plaid::Types::Owner] }, optional: false, nullable: false

      field :attributes, -> { Plaid::Types::CraReportGetHomeLendingVoaAccountAttributes }, optional: false, nullable: true

      field :identity_match, -> { Plaid::Types::CraReportGetAccountIdentityMatch }, optional: true, nullable: true

      field :ownership_type, -> { Plaid::Types::OwnershipType }, optional: true, nullable: true

      field :historical_balances, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingVoaAccountHistoricalBalance] }, optional: false, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingVoaTransaction] }, optional: false, nullable: false
    end
  end
end
