# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationPaymentTokenCreateResponse defines the response schema for
    # `/payment_initiation/payment/token/create`
    class PaymentInitiationPaymentTokenCreateResponse < Internal::Types::Model
      field :payment_token, -> { String }, optional: false, nullable: false

      field :payment_token_expiration_time, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
