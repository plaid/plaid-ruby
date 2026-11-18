# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraVerificationIncomePayFrequency
      extend Plaid::Internal::Types::Enum

      WEEKLY = "WEEKLY"
      BIWEEKLY = "BIWEEKLY"
      SEMI_MONTHLY = "SEMI_MONTHLY"
      MONTHLY = "MONTHLY"
      DAILY = "DAILY"
      UNKNOWN = "UNKNOWN"
    end
  end
end
