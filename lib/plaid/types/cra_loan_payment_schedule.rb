# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraLoanPaymentSchedule
      extend Plaid::Internal::Types::Enum

      DAILY = "DAILY"
      WEEKLY = "WEEKLY"
      BIWEEKLY = "BIWEEKLY"
      MONTHLY = "MONTHLY"
      QUARTERLY = "QUARTERLY"
      ANNUALLY = "ANNUALLY"
      OTHER = "OTHER"
    end
  end
end
