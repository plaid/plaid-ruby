# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashAdvancePayFrequency
      extend Plaid::Internal::Types::Enum

      WEEKLY = "WEEKLY"
      BIWEEKLY = "BIWEEKLY"
      SEMI_MONTHLY = "SEMI_MONTHLY"
      MONTHLY = "MONTHLY"
      ANNUALLY = "ANNUALLY"
      DAILY = "DAILY"
      DYNAMIC = "DYNAMIC"
    end
  end
end
