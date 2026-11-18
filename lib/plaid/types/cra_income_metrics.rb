# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled income metrics for a given income stream or user summary.
    class CraIncomeMetrics < Internal::Types::Model
      field :current, -> { Plaid::Types::CraCurrentModeledIncome }, optional: false, nullable: true

      field :projected, -> { Plaid::Types::CraProjectedModeledIncome }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
