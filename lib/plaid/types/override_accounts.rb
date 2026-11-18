# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data to use to set values of test accounts. Some values cannot be specified in the schema and will instead be
    # calculated from other test data in order to achieve more consistent, realistic test data.
    class OverrideAccounts < Internal::Types::Model
      field :type, -> { Plaid::Types::OverrideAccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :starting_balance, -> { Float }, optional: true, nullable: false

      field :force_available_balance, -> { Float }, optional: true, nullable: false

      field :has_null_available_balance, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :meta, -> { Plaid::Types::Meta }, optional: true, nullable: false

      field :numbers, -> { Plaid::Types::Numbers }, optional: true, nullable: false

      field :transactions, -> { Internal::Types::Array[Plaid::Types::TransactionOverride] }, optional: true, nullable: false

      field :holdings, -> { Internal::Types::Array[Plaid::Types::HoldingsOverride] }, optional: true, nullable: false

      field :investment_transactions, -> { Internal::Types::Array[Plaid::Types::InvestmentsTransactionsOverride] }, optional: true, nullable: false

      field :identity, -> { Plaid::Types::OwnerOverride }, optional: true, nullable: false

      field :liability, -> { Plaid::Types::LiabilityOverride }, optional: true, nullable: false

      field :inflow_model, -> { Plaid::Types::InflowModel }, optional: true, nullable: false

      field :income, -> { Plaid::Types::IncomeOverride }, optional: true, nullable: false
    end
  end
end
