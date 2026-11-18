# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SignalPaymentMethod
      extend Plaid::Internal::Types::Enum

      SAME_DAY_ACH = "SAME_DAY_ACH"
      NEXT_DAY_ACH = "NEXT_DAY_ACH"
      STANDARD_ACH = "STANDARD_ACH"
      MULTIPLE_PAYMENT_METHODS = "MULTIPLE_PAYMENT_METHODS"
    end
  end
end
