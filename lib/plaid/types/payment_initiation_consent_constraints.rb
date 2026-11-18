# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Limitations that will be applied to payments initiated using the payment consent.
    class PaymentInitiationConsentConstraints < Internal::Types::Model
      field :valid_date_time, -> { Plaid::Types::PaymentConsentValidDateTime }, optional: true, nullable: true

      field :max_payment_amount, -> { Plaid::Types::PaymentAmount }, optional: false, nullable: false

      field :periodic_amounts, -> { Internal::Types::Array[Plaid::Types::PaymentConsentPeriodicAmount] }, optional: false, nullable: false
    end
  end
end
