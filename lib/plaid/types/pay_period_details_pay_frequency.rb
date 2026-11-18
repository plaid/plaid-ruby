# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PayPeriodDetailsPayFrequency
      extend Plaid::Internal::Types::Enum

      PAY_FREQUENCY_UNKNOWN = "PAY_FREQUENCY_UNKNOWN"
      PAY_FREQUENCY_WEEKLY = "PAY_FREQUENCY_WEEKLY"
      PAY_FREQUENCY_BIWEEKLY = "PAY_FREQUENCY_BIWEEKLY"
      PAY_FREQUENCY_SEMIMONTHLY = "PAY_FREQUENCY_SEMIMONTHLY"
      PAY_FREQUENCY_MONTHLY = "PAY_FREQUENCY_MONTHLY"
    end
  end
end
