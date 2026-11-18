# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the status of a payment has changed. Not fired when the new status is `PAYMENT_STATUS_INPUT_NEEDED`,
    # `PAYMENT_STATUS_AUTHORISING`, or `PAYMENT_STATUS_PROCESSING`. For a full explanation of payment statuses and how
    # to handle each, see the [Payment Status guide](https://plaid.com/docs/payment-initiation/payment-status/).
    #
    # Note: For standard Payment Initiation, Plaid payment statuses do not constitute proof that funds have arrived in
    # the recipient's account, and you should not use `new_payment_status` to confirm fund settlement. For options that
    # provide confirmation of fund receipt, see [Virtual
    # Accounts](https://plaid.com/docs/payment-initiation/virtual-accounts/payment-confirmation/).
    class PaymentStatusUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :payment_id, -> { String }, optional: false, nullable: false

      field :transaction_id, -> { String }, optional: true, nullable: true

      field :new_payment_status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false

      field :old_payment_status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false

      field :original_reference, -> { String }, optional: false, nullable: true

      field :adjusted_reference, -> { String }, optional: true, nullable: true

      field :original_start_date, -> { String }, optional: false, nullable: true

      field :adjusted_start_date, -> { String }, optional: false, nullable: true

      field :timestamp, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
