# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationConsentPaymentExecuteResponse defines the response schema for
    # `/payment_initiation/consent/payment/execute`
    class PaymentInitiationConsentPaymentExecuteResponse < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true
    end
  end
end
