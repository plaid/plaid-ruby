# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationPaymentGetResponse defines the response schema for `/payment_initiation/payment/get`
    class PaymentInitiationPaymentGetResponse < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Plaid::Types::PaymentAmount }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false

      field :recipient_id, -> { String }, optional: false, nullable: false

      field :reference, -> { String }, optional: false, nullable: false

      field :adjusted_reference, -> { String }, optional: true, nullable: true

      field :last_status_update, -> { String }, optional: false, nullable: false

      field :schedule, -> { Plaid::Types::ExternalPaymentScheduleGet }, optional: true, nullable: true

      field :refund_details, -> { Plaid::Types::ExternalPaymentRefundDetails }, optional: true, nullable: true

      field :bacs, -> { Plaid::Types::SenderBacsNullable }, optional: false, nullable: true

      field :iban, -> { String }, optional: false, nullable: true

      field :refund_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :amount_refunded, -> { Plaid::Types::PaymentAmountRefunded }, optional: true, nullable: false

      field :wallet_id, -> { String }, optional: true, nullable: true

      field :scheme, -> { Plaid::Types::PaymentScheme }, optional: true, nullable: true

      field :adjusted_scheme, -> { Plaid::Types::PaymentScheme }, optional: true, nullable: true

      field :consent_id, -> { String }, optional: true, nullable: true

      field :transaction_id, -> { String }, optional: true, nullable: true

      field :end_to_end_id, -> { String }, optional: true, nullable: true

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :institution_id, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
