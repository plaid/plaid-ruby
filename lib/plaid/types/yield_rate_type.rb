# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module YieldRateType
      extend Plaid::Internal::Types::Enum

      COUPON = "coupon"
      COUPON_EQUIVALENT = "coupon_equivalent"
      DISCOUNT = "discount"
      YIELD = "yield"
    end
  end
end
