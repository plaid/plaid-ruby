# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxPaymentSimulateResponse defines the response schema for `/sandbox/payment/simulate`
    class SandboxPaymentSimulateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :old_status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false

      field :new_status, -> { Plaid::Types::PaymentInitiationPaymentStatus }, optional: false, nullable: false
    end
  end
end
