# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The diligence information for the originator.
    class TransferOriginatorDiligence < Internal::Types::Model
      field :dba, -> { String }, optional: false, nullable: false

      field :tax_id, -> { String }, optional: false, nullable: false

      field :credit_usage_configuration, -> { Plaid::Types::TransferCreditUsageConfiguration }, optional: true, nullable: true

      field :debit_usage_configuration, -> { Plaid::Types::TransferDebitUsageConfiguration }, optional: true, nullable: true

      field :address, -> { Plaid::Types::TransferOriginatorAddress }, optional: false, nullable: false

      field :website, -> { String }, optional: false, nullable: false

      field :naics_code, -> { String }, optional: false, nullable: false

      field :funding_account, -> { Plaid::Types::TransferFundingAccount }, optional: false, nullable: false
    end
  end
end
