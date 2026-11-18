# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Monthly summary of transactions within a specific time period, showing aggregated amounts.
    class MonthlySummary < Internal::Types::Model
      field :start_date, -> { String }, optional: true, nullable: true

      field :end_date, -> { String }, optional: true, nullable: true

      field :total_amount, -> { Plaid::Types::AmountWithCurrency }, optional: true, nullable: true
    end
  end
end
