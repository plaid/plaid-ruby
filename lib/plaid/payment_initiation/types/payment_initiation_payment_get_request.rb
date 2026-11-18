# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationPaymentGetRequest < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
