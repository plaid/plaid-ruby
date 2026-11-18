# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the historical annual income amount.
    class HistoricalAnnualIncome < Internal::Types::Model
      field :baseline_amount, -> { Float }, optional: true, nullable: true

      field :current_amount, -> { Float }, optional: false, nullable: false
    end
  end
end
