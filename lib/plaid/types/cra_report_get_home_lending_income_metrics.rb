# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled current income for a given currency. Home Lending reports current income only; there is no projected
    # income figure.
    class CraReportGetHomeLendingIncomeMetrics < Internal::Types::Model
      field :current, -> { Plaid::Types::CraCurrentModeledIncome }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
