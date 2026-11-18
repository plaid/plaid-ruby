# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The transaction details
    class WalletTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :wallet_id, -> { String }, optional: false, nullable: false

      field :reference, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::WalletTransactionType }, optional: false, nullable: false

      field :scheme, -> { Plaid::Types::WalletPaymentScheme }, optional: true, nullable: true

      field :amount, -> { Plaid::Types::WalletTransactionAmount }, optional: false, nullable: false

      field :counterparty, -> { Plaid::Types::WalletTransactionCounterpartyInResponse }, optional: false, nullable: false

      field :status, -> { Plaid::Types::WalletTransactionStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :last_status_update, -> { String }, optional: false, nullable: false

      field :payee_verification_status, -> { Plaid::Types::WalletTransactionPayeeVerificationStatus }, optional: true, nullable: true

      field :payment_id, -> { String }, optional: true, nullable: true

      field :failure_reason, -> { Plaid::Types::WalletTransactionFailureReason }, optional: true, nullable: true

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :related_transactions, -> { Internal::Types::Array[Plaid::Types::WalletTransactionRelation] }, optional: true, nullable: false
    end
  end
end
