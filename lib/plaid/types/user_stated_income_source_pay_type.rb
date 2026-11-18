# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module UserStatedIncomeSourcePayType
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      GROSS = "GROSS"
      NET = "NET"
    end
  end
end
