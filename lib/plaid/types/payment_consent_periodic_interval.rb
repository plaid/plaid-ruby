# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentConsentPeriodicInterval
      extend Plaid::Internal::Types::Enum

      DAY = "DAY"
      WEEK = "WEEK"
      MONTH = "MONTH"
      YEAR = "YEAR"
    end
  end
end
