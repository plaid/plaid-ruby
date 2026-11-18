# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about a specific occurrence of a negative balance period, including start and end dates.
    class NegativeBalanceOccurrence < Internal::Types::Model
      field :start_date, -> { String }, optional: true, nullable: true

      field :end_date, -> { String }, optional: true, nullable: true

      field :minimum_balance, -> { Plaid::Types::AmountWithCurrency }, optional: true, nullable: true
    end
  end
end
