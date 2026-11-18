# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled estimate of the annual income.
    class CraAnnualIncomeValues < Internal::Types::Model
      field :gross_income, -> { Float }, optional: false, nullable: false

      field :net_income, -> { Float }, optional: false, nullable: false
    end
  end
end
