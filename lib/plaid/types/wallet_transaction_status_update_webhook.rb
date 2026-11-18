# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the status of a wallet transaction has changed.
    class WalletTransactionStatusUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :transaction_id, -> { String }, optional: false, nullable: false

      field :payment_id, -> { String }, optional: true, nullable: true

      field :wallet_id, -> { String }, optional: true, nullable: false

      field :new_status, -> { Plaid::Types::WalletTransactionStatus }, optional: false, nullable: false

      field :old_status, -> { Plaid::Types::WalletTransactionStatus }, optional: false, nullable: false

      field :failure_reason, -> { Plaid::Types::WalletTransactionFailureReason }, optional: true, nullable: true

      field :timestamp, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
