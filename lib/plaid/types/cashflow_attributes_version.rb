# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashflowAttributesVersion
      extend Plaid::Internal::Types::Enum

      V10 = "v1.0"
      V20 = "v2.0"
      CFI1 = "CFI1"
    end
  end
end
