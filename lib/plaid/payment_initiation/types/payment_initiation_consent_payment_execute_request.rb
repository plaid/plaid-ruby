# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationConsentPaymentExecuteRequest < Internal::Types::Model
        field :consent_id, -> { String }, optional: false, nullable: false

        field :amount, -> { Plaid::Types::PaymentAmount }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: false, nullable: false

        field :reference, -> { String }, optional: true, nullable: true

        field :scope, -> { Plaid::PaymentInitiation::Types::PaymentInitiationConsentPaymentExecuteRequestScope }, optional: true, nullable: true

        field :processing_mode, -> { Plaid::Types::PaymentInitiationConsentProcessingMode }, optional: true, nullable: false
      end
    end
  end
end
