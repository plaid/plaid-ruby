# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled current income for a single income category.
    class CraReportGetHomeLendingCategoryIncome < Internal::Types::Model
      field :income_category, -> { Plaid::Types::CraIncomeCategory }, optional: false, nullable: false

      field :current, -> { Plaid::Types::CraCurrentModeledIncome }, optional: false, nullable: true
    end
  end
end
