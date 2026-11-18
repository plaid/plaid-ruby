# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the total monthly income
    class TotalMonthlyIncomeInsights < Internal::Types::Model
      field :baseline_amount, -> { Float }, optional: true, nullable: true

      field :current_amount, -> { Float }, optional: false, nullable: false
    end
  end
end
