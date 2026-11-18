# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details regarding the proposed transfer.
    class TransferAuthorizationProposedTransfer < Internal::Types::Model
      field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

      field :account_id, -> { String }, optional: true, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: true

      field :ledger_id, -> { String }, optional: true, nullable: true

      field :type, -> { Plaid::Types::TransferType }, optional: false, nullable: false

      field :user, -> { Plaid::Types::TransferUserInResponse }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :requested_amount, -> { String }, optional: false, nullable: false

      field :network, -> { String }, optional: false, nullable: false

      field :wire_details, -> { Plaid::Types::TransferWireDetails }, optional: true, nullable: true

      field :origination_account_id, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :originator_client_id, -> { String }, optional: false, nullable: true

      field :credit_funds_source, -> { Plaid::Types::TransferCreditFundsSource }, optional: false, nullable: true
    end
  end
end
