# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IncomeBreakdownType
      extend Plaid::Internal::Types::Enum

      BONUS = "bonus"
      OVERTIME = "overtime"
      REGULAR = "regular"
    end
  end
end
