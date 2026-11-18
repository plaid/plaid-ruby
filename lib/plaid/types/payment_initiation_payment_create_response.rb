# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationPaymentCreateResponse defines the response schema for `/payment_initiation/payment/create`
    class PaymentInitiationPaymentCreateResponse < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PaymentInitiationPaymentCreateStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
