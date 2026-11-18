# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationPaymentListResponse defines the response schema for `/payment_initiation/payment/list`
    class PaymentInitiationPaymentListResponse < Internal::Types::Model
      field :payments, -> { Internal::Types::Array[Plaid::Types::PaymentInitiationPayment] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
