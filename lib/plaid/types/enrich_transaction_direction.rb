# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EnrichTransactionDirection
      extend Plaid::Internal::Types::Enum

      INFLOW = "INFLOW"
      OUTFLOW = "OUTFLOW"
    end
  end
end
