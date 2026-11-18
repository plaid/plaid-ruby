# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentInitiationPaymentCreateStatus
      extend Plaid::Internal::Types::Enum

      PAYMENT_STATUS_INPUT_NEEDED = "PAYMENT_STATUS_INPUT_NEEDED"
    end
  end
end
