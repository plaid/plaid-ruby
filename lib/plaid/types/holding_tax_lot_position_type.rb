# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module HoldingTaxLotPositionType
      extend Plaid::Internal::Types::Enum

      LONG = "LONG"
      SHORT = "SHORT"
    end
  end
end
