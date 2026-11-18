# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module UserStatedIncomeSourceFrequency
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      WEEKLY = "WEEKLY"
      BIWEEKLY = "BIWEEKLY"
      SEMI_MONTHLY = "SEMI_MONTHLY"
      MONTHLY = "MONTHLY"
    end
  end
end
