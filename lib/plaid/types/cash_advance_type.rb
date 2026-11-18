# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashAdvanceType
      extend Plaid::Internal::Types::Enum

      FIRST = "FIRST"
      REPEAT = "REPEAT"
    end
  end
end
