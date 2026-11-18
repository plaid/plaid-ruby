# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a breakdown of the different income types on the paystub.
    class IncomeBreakdown < Internal::Types::Model
      field :type, -> { Plaid::Types::IncomeBreakdownType }, optional: false, nullable: true

      field :rate, -> { Float }, optional: false, nullable: true

      field :hours, -> { Float }, optional: false, nullable: true

      field :total, -> { Float }, optional: false, nullable: true
    end
  end
end
