# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled income for one currency, broken down by income category.
    class CraReportGetHomeLendingIncomeByCategories < Internal::Types::Model
      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :categories, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingCategoryIncome] }, optional: false, nullable: false
    end
  end
end
