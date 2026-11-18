# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationPaymentReverseResponse defines the response schema for `/payment_initiation/payment/reverse`
    class PaymentInitiationPaymentReverseResponse < Internal::Types::Model
      field :refund_id, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::WalletTransactionStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
