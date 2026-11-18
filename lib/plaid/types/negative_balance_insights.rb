# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights into negative balance occurrences, including frequency, duration, and minimum balance details.
    class NegativeBalanceInsights < Internal::Types::Model
      field :days_since_last_occurrence, -> { Integer }, optional: true, nullable: true

      field :days_with_negative_balance, -> { Integer }, optional: true, nullable: true

      field :minimum_balance, -> { Plaid::Types::AmountWithCurrency }, optional: true, nullable: true

      field :occurrences, -> { Internal::Types::Array[Plaid::Types::NegativeBalanceOccurrence] }, optional: true, nullable: false
    end
  end
end
