# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This is a container object for all lending-related insights. This field will be returned only for European
    # customers.
    class AccountInsights < Internal::Types::Model
      field :risk, -> { Plaid::Types::RiskIndicators }, optional: true, nullable: true

      field :affordability, -> { Plaid::Types::AffordabilityInsights }, optional: true, nullable: true
    end
  end
end
