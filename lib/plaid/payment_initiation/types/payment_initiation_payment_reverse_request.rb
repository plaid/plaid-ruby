# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationPaymentReverseRequest < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: false, nullable: false

        field :reference, -> { String }, optional: false, nullable: false

        field :amount, -> { Plaid::Types::PaymentAmountToRefund }, optional: true, nullable: false

        field :counterparty_date_of_birth, -> { String }, optional: true, nullable: true

        field :counterparty_address, -> { Plaid::Types::PaymentInitiationAddress }, optional: true, nullable: true
      end
    end
  end
end
